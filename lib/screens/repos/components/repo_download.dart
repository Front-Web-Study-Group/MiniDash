import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:mini_dash/models/docset/docsets.dart';
import 'package:mini_dash/models/docset/repos/repo.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:mini_dash/api/dash.dart';
import 'package:mini_dash/models/docset/repos/repo_download.dart';
import 'package:provider/provider.dart';

class DownloadBtn extends StatefulWidget {
  DownloadBtn(this.repo, {Key key}) : super(key: key);

  final Repo repo;

  @override
  _DownloadBtnState createState() => _DownloadBtnState(this.repo);
}

class _DownloadBtnState extends State<DownloadBtn>
    with AutomaticKeepAliveClientMixin {
  final Repo repo;

  bool downloading = false;

  double progress = 0;

  CancelToken token;

  _DownloadBtnState(this.repo);

  @override
  bool get wantKeepAlive => true;

  forceUpdate() {
    context.read<Docsets>().forceUpdate();
  }

  @override
  void dispose() {
    super.dispose();

    this.token?.cancel();
  }

  _onDelete() async {
    final action = await confirm(context, content: '确认删除?');

    if (action) {
      var isDelete = await repo.deleteDocset();
      var msg = '成功';
      if (!isDelete) {
        msg = '失败';
      }
      BotToast.showText(text: '删除$msg');
      forceUpdate();
    }
  }

  _onDownload() async {
    if (!this.downloading) {
      var isCanInstall = repo.isCanInstall();
      if (!isCanInstall) {
        BotToast.showText(text: '当前文档无法下载');
        return;
      }
      setState(() {
        this.downloading = true;
      });
      // onAnimationStart();
      var data = await getDownloadUrls(repo.feedURL);
      repo.parseXML(data);
      this.token = CancelToken();
      var repoDownload = RepoDownload(repo);
      await repoDownload.downloads(
          onReceiveProgress: (value) {
            if (!this.token.isCancelled) {
              setState(() {
                this.progress = value;
                if (value >= 1) {
                  repo.isDownload = true;
                  this.downloading = false;
                  BotToast.showText(text: '${repo.name} 下载成功');
                }
              });
            }
          },
          cancelToken: token,
          onError: (e) {
            repo.isDownload = false;
            this.downloading = false;
          });
      if (!this.token.isCancelled) {
        forceUpdate();
      }
    } else {
      final action = await confirm(context, content: '正在下载中，确认取消?');
      if (action) {
        this.setState(() {
          this.downloading = false;
        });
        this.token?.cancel();
        BotToast.showText(text: '取消下载');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (repo.isDownload) {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            child: Icon(
              Icons.done,
              size: 18,
            ),
          ),
          GestureDetector(
            onTap: _onDelete,
            child: Icon(
              Icons.delete,
              color: dPrimaryColor,
            ),
          )
        ],
      );
    }
    if (this.downloading) {
      return GestureDetector(
        onTap: _onDownload,
        child: SizedBox(
            width: 24,
            height: 24,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.grey[200],
                value: progress,
              ),
              Positioned(
                  child: Container(
                width: 8,
                height: 8,
                color: dPrimaryColor,
                // child: ,
              ))
            ])),
      );
    }
    return GestureDetector(
        onTap: _onDownload,
        child: Icon(
          Icons.play_for_work,
          size: 28,
        ));
  }
}
