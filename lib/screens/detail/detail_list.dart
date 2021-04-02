import 'package:flutter/material.dart';
import 'package:mini_dash/models/Document.dart';
import 'package:mini_dash/screens/detail/components/detail_card.dart';
import 'package:mini_dash/screens/detail/message_screen.dart';

class DetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: documentData.length,
        itemBuilder: (context, index) => DetailCard(
          document: documentData[index],
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagesScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
