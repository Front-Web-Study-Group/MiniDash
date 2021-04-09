import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mini_dash/models/User.dart';
import 'package:mini_dash/screens/document/document_info.dart';
import '../../../constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required this.document,
    @required this.press,
  }) : super(key: key);

  final User document;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(document.image),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/help.svg"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentInfo(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
