import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/models/Bookshelf.dart';
import 'package:mini_dash/screens/document/document_info.dart';

class Bookshelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: kDefaultPadding / 3,
          right: kDefaultPadding / 3,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 0.72 //宽高比为1时，子widget
              ),
          itemCount: bookshelfData.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
                bottom: kDefaultPadding),
            child: Container(
              color: bookshelfData[index].color,
              child: IconButton(
                icon: Icon(Icons.receipt_long),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentInfo(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, double.infinity);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
