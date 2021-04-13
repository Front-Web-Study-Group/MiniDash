import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/screens/home/home_screen.dart';
import '../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    @required this.size,
    @required this.route,
  }) : super(key: key);
  final Size size;
  final String route;

  @override
  Widget build(BuildContext context) {
    Widget backBtn(String route) {
      switch (route) {
        case 'home':
          return SizedBox();
          break;
        default:
          return Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.account_balance),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                ),
              ),
            ],
          );
      }
    }

    return Container(
        margin: EdgeInsets.only(
            top: kDefaultPadding * 2.5, bottom: kDefaultPadding * 0.5),
        height: 50,
        child: Row(
          children: [
            backBtn(route),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: kDefaultPadding / 2, right: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
