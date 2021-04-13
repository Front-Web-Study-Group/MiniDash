import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_dash/models/ToolList.dart';
import '../constants.dart';

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
    Future<int> _showToolBox() {
      return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, childAspectRatio: 1),
            shrinkWrap: true, // 自适应高都
            itemCount: toolConfigList.length,
            itemBuilder: (BuildContext context, int index) {
              return IconButton(
                  icon: SvgPicture.asset(
                    toolConfigList[index].image,
                  ),
                  onPressed: () {
                    toolConfigList[index].press(context);
                    Navigator.of(context).pop();
                  });
            },
          );
        },
      );
    }

    return Container(
      margin:
          EdgeInsets.only(bottom: kDefaultPadding, right: kDefaultPadding / 10),
      height: 50,
      child: IconButton(
        icon: Icon(Icons.account_balance),
        onPressed: () async {
          int type = await _showToolBox();
          print(type);
        },
      ),
    );
  }
}
