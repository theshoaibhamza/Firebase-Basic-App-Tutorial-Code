// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:terybin/Widgets/BoldText.dart';

class MyDialogBox {
  MyShowDialog(
      String title, String content, String Contentfont, BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: BoldText(text: title),
            content: BoldText(
              text: content,
              font: Contentfont,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: BoldText(text: "Ok"))
            ],
          );
        }));
  }
}
