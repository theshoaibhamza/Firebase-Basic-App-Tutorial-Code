// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_element, must_be_immutable

import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  double height;
  double width;

  double left;
  double right;
  double top;
  double bottom;

  Skelton({
    super.key,
    this.right = 0,
    this.left = 0,
    this.top = 0,
    this.bottom = 0,
    this.width = 50,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.08),
          borderRadius: BorderRadiusDirectional.circular(30)),
    );
  }
}
