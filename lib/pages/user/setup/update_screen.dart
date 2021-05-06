import 'package:flutter/material.dart';
import 'package:mini_dash/utils/constants.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("版本信息"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  '错误事项',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                    '好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...'),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                    '好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...好多好多的描述...')
              ],
            ))
          ],
        ),
      ),
    );
  }
}
