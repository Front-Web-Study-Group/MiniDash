import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<SearchInput> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String countryId;
  List<String> country = [
    "America",
    "Brazil",
    "Canada",
    "India",
    "Mongalia",
    "USA",
    "China",
    "Russia",
    "Germany"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Form"),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropDownField(
                onValueChanged: (dynamic value) {
                  countryId = value;
                },
                value: countryId,
                required: false,
                hintText: 'Choose a country',
                labelText: 'Country',
                items: country,
              ),
            ]),
      ),
    );
  }
}
