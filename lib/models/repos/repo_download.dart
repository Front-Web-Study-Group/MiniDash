import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:mini_dash/api/dash.dart';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as path;

import './repos.dart';

class RepoDownload {
  // static RepoDownload get instance => _getInstance();

  // static RepoDownload _instance;

  // static _getInstance() {
  //   if (_instance == null) {
  //     _instance = RepoDownload._internal();
  //   }
  //   return _instance;
  // }

  // factory RepoDownload() => _getInstance();

  // RepoDownload._internal();

  Repo repo;

  String docsetsPath = 'docsets';

  RepoDownload(this.repo);

  // 下载/解压名字都把版本带上
  String getName(String fName) {
    if (repo.noVersion) {
      return fName;
    }
    var fNames = fName.split('.');
    var name = fNames.first + '-${repo.version}';
    var suffix = fNames.last;
    return [name, suffix].join('.');
  }

  Future<String> getStorePath() async {
    var appPath = await getAppPath();
    return path.join(appPath, docsetsPath, repo.docsetName);
  }

  Future<String> getDownloadPath(String url) async {
    var fName = url.split('/').last;
    var name = getName(fName);

    var tempPath = await getTempPath();
    return path.join(tempPath, docsetsPath, name);
  }

  // 解压 docset tgz 格式文件压缩文件
  // TODO:
  // 这里应该根据文件后缀处理下，但貌似都是 tgz 格式的，可作为优化手段
  unPack(String file) async {
    final bytes = File(file).readAsBytesSync();
    final Archive archive =
        new TarDecoder().decodeBytes(GZipDecoder().decodeBytes(bytes));
    final sPath = await getStorePath();

    for (final file in archive) {
      var list = path.split(file.name);
      var name = getName(list.first);
      list.replaceRange(0, 1, [name]);
      final filePath = path.joinAll([sPath, ...list]);
      if (file.isFile) {
        final data = file.content as List<int>;
        File(filePath)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(filePath)..create(recursive: true);
      }
    }
  }

  download(
    String url,
    String name, {
    Function onReceiveProgress,
    CancelToken cancelToken,
  }) async {
    await dashApi.download(url, name,
        onReceiveProgress: (receivedBytes, totalBytes) {
      if (onReceiveProgress != null) {
        var progress = (receivedBytes / totalBytes);
        onReceiveProgress(progress);
      }
      // 超时时间为1小时
    },
        cancelToken: cancelToken,
        options: Options(receiveTimeout: 3600000)).catchError((Object err) {
      if (!CancelToken.isCancel(err)) {
        throw err;
      }
    });
  }

  downloads({Function onReceiveProgress, CancelToken cancelToken}) async {
    var urls = repo.urls;
    for (var url in urls) {
      var file = await getDownloadPath(url);
      try {
        // 先查一般临时目录是否有缓存文件
        var isExist = File(file).existsSync();
        if (!isExist) {
          await download(url, file,
              onReceiveProgress: onReceiveProgress, cancelToken: cancelToken);
        } else {
          // 有缓存文件直接下载完成
          onReceiveProgress(1.toDouble());
          break;
        }
      } catch (e) {
        print('download error: $e');
        continue;
      }
      if (!cancelToken.isCancelled) {
        // 解压可放在后台去异步处理
        await unPack(file);
      }
      break;
    }
  }
}
