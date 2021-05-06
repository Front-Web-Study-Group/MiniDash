import 'package:flutter/material.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:mini_dash/routers/router_info.dart';
import 'package:mini_dash/utils/constants.dart';
import '../utils/constants.dart';

class SearchBox extends StatelessWidget {
  renderLeftIcon(context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconButton(
              icon: Icon(Icons.description, color: Colors.white),
              onPressed: () {
                NavigatorUtils.push(context, RouterConst.repos);
              }),
        ),
      ],
    );
  }

  const SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: kDefaultPadding * 2.5, bottom: kDefaultPadding * 0.5),
        height: 50,
        child: Row(
          children: [
            renderLeftIcon(context),
            // SearchInput(),
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
