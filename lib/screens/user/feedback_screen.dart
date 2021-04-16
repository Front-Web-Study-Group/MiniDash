import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/models/User.dart';
import 'package:mini_dash/screens/user/component/user_card.dart';
import 'package:mini_dash/utils/event_bus.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _unameController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("用户反馈"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding * 5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildColumn('常见问题1', feedbackConfigList1),
                    buildColumn('常见问题2', feedbackConfigList2),
                    buildColumn('常见问题3', feedbackConfigList3),
                  ],
                ),
              ),
            ),
            Positioned(
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
                bottom: kDefaultPadding * 2,
                child: GestureDetector(
                    onTap: () {
                      Future<int> type = _feedbackPanel(contexts: context);
                      print(type);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(0),
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 54,
                      decoration: BoxDecoration(
                        color: kCardBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Text(
                        '我要反馈',
                      ),
                    ))),
          ],
        ));
  }

  // 帮助
  Future<int> _feedbackPanel({contexts}) {
    BuildContext context = contexts;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("反馈"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('反馈建议'),
              Card(
                  color: kCardBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: TextField(
                      maxLines: 8,
                      decoration:
                          InputDecoration.collapsed(hintText: "请输入您的反馈信息..."),
                    ),
                  )),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text('联系方式'),
              Card(
                  color: kCardBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: TextField(
                      maxLines: 1,
                      decoration:
                          InputDecoration.collapsed(hintText: "邮箱或手机..."),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  Column buildColumn(text, list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) => UserCard(
              document: list[index],
              press: () {
                list[index].press(context);
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, right: kDefaultPadding),
          child: Divider(
            color: Colors.black38,
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
      ],
    );
  }
}
