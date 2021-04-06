import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:mini_dash/constants.dart';

class DetailDard extends StatelessWidget {
  const DetailDard({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(
          left: kDefaultPadding * 0.5,
          right: kDefaultPadding * 0.5,
        ),
        child: Column(
            children: List.generate(choices.length, (index) {
          return Center(
            child: SelectCard(choice: choices[index]),
          );
        })));
  }
}

class DetailItems extends StatelessWidget {
  const DetailItems({
    Key key,
    @required this.size,
    @required this.title,
    @required this.descriptions,
  }) : super(key: key);

  final Size size;
  final String title;
  final String descriptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kDefaultPadding * 0.5,
        left: kDefaultPadding * 0.5,
        bottom: kDefaultPadding * 0.5,
        right: kDefaultPadding * 0.5,
      ),
      width: size.width,
      child: Slidable(
        child: Row(children: <Widget>[
          Image.asset(
            "assets/images/bottom_img_1.png",
            width: size.width * 0.2,
          ),
          SizedBox(
            width: size.width * 0.5,
            child: RichText(
              overflow: TextOverflow.visible,
              maxLines: 2,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "$title\n".toUpperCase(),
                      style: Theme.of(context).textTheme.button),
                  TextSpan(
                    text: "$descriptions",
                    style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/images/bottom_img_1.png",
            width: size.width * 0.12,
            height: 50,
          ),
        ]),
        actionExtentRatio: 1 / 5,
        actionPane: SlidableStrechActionPane(),
        actions: <Widget>[
          IconSlideAction(
            caption: 'collection',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => print('collection'),
          ),
          IconSlideAction(
            caption: 'note',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => print('note'),
          ),
          IconSlideAction(
            caption: 'something',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => print('something'),
          )
        ],
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Contact', icon: Icons.contacts),
  const Choice(title: 'Map', icon: Icons.map),
  const Choice(title: 'Phone', icon: Icons.phone),
  const Choice(title: 'Camera', icon: Icons.camera_alt),
  const Choice(title: 'Setting', icon: Icons.settings),
  const Choice(title: 'Album', icon: Icons.photo_album),
  const Choice(title: 'WiFi', icon: Icons.wifi),
  const Choice(title: 'GPS', icon: Icons.gps_fixed),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
        child: DetailItems(
      size: size,
      title: choice.title,
      descriptions: choice.title,
    ));
  }
}
