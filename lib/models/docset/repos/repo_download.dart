import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_dash/api/dash.dart';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as path;

import './repo.dart';

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

  RepoDownload(this.repo);

  static Archive getArchive(String file) {
    final bytes = File(file).readAsBytesSync();
    final Archive archive =
        new TarDecoder().decodeBytes(GZipDecoder().decodeBytes(bytes));
    return archive;
  }

  // 解压 docset tgz 格式文件压缩文件
  // TODO:
  // 这里应该根据文件后缀处理下，但貌似都是 tgz 格式的，可作为优化手段
  // 解压时间会很长，必须提示给用户可以取消解压才行
  unPack(String file) async {
    final sPath = await repo.getStorePath();
    var archive = await compute(getArchive, file);

    for (final file in archive) {
      var list = path.split(file.name);
      var name = repo.getName(list.first);
      list.replaceRange(0, 1, [name]);
      final filePath = path.joinAll([sPath, ...list]);
      if (file.isFile) {
        final data = file.content as List<int>;
        var nfile = File(filePath);
        await nfile.create(recursive: true);
        await nfile.writeAsBytes(data);
      } else {
        await Directory(filePath).create(recursive: true);
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
        print('progress: $progress');
        onReceiveProgress(progress);
      }
      // 下载超时时间为1小时
    },
        cancelToken: cancelToken,
        options: Options(receiveTimeout: 3600000)).catchError((Object err) {
      if (!CancelToken.isCancel(err)) {
        throw err;
      }
    });
  }

  downloads(
      {Function onReceiveProgress,
      CancelToken cancelToken,
      Function onError}) async {
    var urls = repo.urls;
    var count = 0;
    for (var url in urls) {
      print('download: $url');
      if (count > 0) {
        BotToast.showText(text: '正在进行第$count次重试');
      }
      count += 1;
      var filePath = await repo.getDownloadPath(url);
      try {
        // 先查一般临时目录是否有缓存文件
        var isExist = File(filePath).existsSync();
        if (!isExist) {
          await download(url, filePath,
              onReceiveProgress: onReceiveProgress, cancelToken: cancelToken);
        } else {
          // 有缓存文件直接下载完成
          onReceiveProgress(1.toDouble());
        }
      } catch (e) {
        BotToast.showText(text: '下载失败');
        print('download error: $e');
        continue;
      }
      if (!cancelToken.isCancelled) {
        try {
          BotToast.showText(text: '正在解压');
          // 解压可放在后台去异步处理
          await unPack(filePath);
          BotToast.showText(text: '解压成功');
        } catch (e) {
          BotToast.showText(text: '解压错误，请重新下载');
          var file = File(filePath);
          file.deleteSync();
          onError(e);
        }
      }
      break;
    }
  }
}
