import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class CustomLogo extends StatelessWidget {
  final Color colorlogo;
  final double? sizelogo;
  final double? sizetag;

  const CustomLogo({Key? key,
    required this.colorlogo,
    this.sizelogo = 53,
    this.sizetag = 30
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Jahitkeeun", style: logoTextStyle.copyWith(color: colorlogo, fontSize: sizelogo)),
        Text("#MaklooninAja", style: mainTextStyle.copyWith(color: colorlogo, fontSize: sizetag))
      ],
    );
  }
}
