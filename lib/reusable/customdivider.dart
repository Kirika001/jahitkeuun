import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double indent;
  final double endIndent;
  final double bottomIndent;
  final double thickness;

  const CustomDivider({
    Key? key,
    this.color = lightGreyColor,
    this.indent = 0,
    this.endIndent = 0,
    this.bottomIndent = 0,
    this.thickness = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: thickness,
      margin: EdgeInsets.only(bottom: bottomIndent, right: endIndent, left: indent),
      decoration: BoxDecoration(color: color),
    );
  }
}
