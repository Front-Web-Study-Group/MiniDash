import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<Loading>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
              child: Column(
            children: [
              if (animation.value >= 0 && animation.value < 100)
                IconButton(
                  icon: Icon(Icons.accessible),
                  iconSize: 50,
                  onPressed: () => {},
                ),
              if (animation.value >= 100)
                IconButton(
                  icon: Icon(Icons.accessible_forward),
                  iconSize: 50,
                  onPressed: () => {},
                ),
              // if (animation.value >= 240)
              //   IconButton(
              //     icon: Icon(Icons.wheelchair_pickup),
              //     iconSize: 50,
              //     onPressed: () => {},
              //   )
            ],
          ));
        },
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
