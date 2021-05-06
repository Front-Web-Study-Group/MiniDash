import 'package:flutter/material.dart';
import 'package:mini_dash/models/Document.dart';
import 'package:mini_dash/pages/document/components/document_card.dart';
import 'package:mini_dash/pages/document/document_info.dart';
import 'package:mini_dash/pages/userData/components/note_text.dart';

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: documentData.length,
              itemBuilder: (context, index) => DocumentCard(
                document: documentData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('用户笔记'),
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      body: SafeArea(child: NoteText()),
                      floatingActionButton: FloatingActionButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocumentInfo(),
                          ),
                        ),
                        tooltip: '查看原文',
                        child: Icon(Icons.list_alt),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
