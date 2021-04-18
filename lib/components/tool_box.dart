import 'package:flutter/material.dart';
import 'package:mini_dash/models/ToolList.dart';
import '../utils/constants.dart';

class ToolBox extends StatefulWidget {
  const ToolBox({Key key}) : super(key: key);

  @override
  _ToolBox createState() => _ToolBox();
}

class _ToolBox extends State<ToolBox> {
  bool floatBtnVisible;

  @override
  void initState() {
    floatBtnVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    Container toolList() {
      return Container(
        color: kBackgroundColor,
        child: Column(
          children: List.generate(toolConfigList.length, (index) {
            return IconButton(
                icon: toolConfigList[index].icon,
                onPressed: () {
                  this.setState(() {
                    floatBtnVisible = false;
                  });
                  toolConfigList[index].press(context);
                });
          }),
        ),
      );
    }

    return Container(
      margin:
          EdgeInsets.only(bottom: kDefaultPadding, right: kDefaultPadding / 10),
      height: floatBtnVisible ? 204 : 60,
      child: Column(
        children: [
          if (floatBtnVisible) toolList(),
          Container(
            color: kSecondaryColor,
            child: IconButton(
              icon: Icon(Icons.apps),
              onPressed: () async {
                this.setState(() {
                  floatBtnVisible = !floatBtnVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
