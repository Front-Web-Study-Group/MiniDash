import 'package:flutter/material.dart';
import 'package:mini_dash/models/Document.dart';

import 'components/document_card.dart';
import 'document_info.dart';

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
