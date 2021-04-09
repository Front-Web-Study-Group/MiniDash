import 'package:flutter/material.dart';
import 'package:mini_dash/models/Document.dart';
import 'package:mini_dash/screens/document/components/document_card.dart';
import 'package:mini_dash/screens/document/document_info.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: documentData.length,
        itemBuilder: (context, index) => DocumentCard(
          document: documentData[index],
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DocumentInfo(),
            ),
          ),
        ),
      ),
    );
  }
}
