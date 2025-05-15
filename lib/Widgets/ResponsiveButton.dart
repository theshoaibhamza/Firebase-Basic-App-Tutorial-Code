// ignore_for_file: file_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, unnecessary_import, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terybin/Widgets/BoldText.dart';

class ResponsiveButton extends StatelessWidget {
  ResponsiveButton(
      {this.color = Colors.white,
      this.height = 60,
      this.width = 120,
      this.icon,
      required this.onTap,
      this.image,
      this.textSize = 20,
      required this.text});

  String onTap;
  String text;
  double textSize;
  double? height;
  double? width;
  Color? color;
  String? image;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/' + onTap);
      },
      child: Container(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(30, 0),
              child: BoldText(
                text: text,
                color: Colors.white,
                size: textSize,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            )
            // logo
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
