import 'package:flutter/material.dart';
import 'package:mini_dash/utils/constants.dart';
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
