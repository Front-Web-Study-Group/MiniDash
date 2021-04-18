import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:mini_dash/models/repos.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:mini_dash/api/dash.dart';

class DownloadBtn extends StatefulWidget {
  DownloadBtn(this.repo, {Key key}) : super(key: key);

  final Repo repo;

  @override
  _DownloadBtnState createState() => _DownloadBtnState(this.repo);
}

class _DownloadBtnState extends State<DownloadBtn>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final Repo repo;

  bool isDownload = false;
  bool downloading = false;

  _DownloadBtnState(this.repo);

  @override
  void initState() {
    super.initState();

    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _controller.addListener(() => setState(() => {}));
  }

  void onAnimationStart() {
    _controller.forward(from: 0.0).then((value) {
      BotToast.showText(text: '下载成功');
      this.isDownload = true;
    });
  }

  _onDelete() async {
    final action = await confirm(context, content: '确认删除?');

    if (action) {
      BotToast.showText(text: '删除成功');
    }
  }

  _onDownload() async {
    if (!this.downloading) {
      this.downloading = true;
      onAnimationStart();
      // TODO:
      var urls = await getDownloadUrls(repo.feedURL);
      // dashApi.download(urls.first)
    } else {
      final action = await confirm(context, content: '正在下载中，确认取消?');
      if (action) {
        BotToast.showText(text: '取消下载');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.isDownload) {
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
                // valueColor: ColorTween(begin: Colors.grey, end: dPrimaryColor)
                //     .animate(_controller),
                value: _controller.value,
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
