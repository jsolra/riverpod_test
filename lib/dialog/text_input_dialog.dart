import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> TextInputDialog(
    BuildContext context, Function(String) onDone) async {
  String inputText = '';

  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Card(
            child: TextField(
              onChanged: (value) {
                inputText = value;
              },
              decoration: InputDecoration(hintText: '내용을 입력해주세요.'),
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Text(
                  '입력',
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onDone(inputText);
                })
          ],
        );
      });
}
