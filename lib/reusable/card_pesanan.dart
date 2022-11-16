import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';

class PesananCard extends StatelessWidget {
  const PesananCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor)
      ),
    );
  }
}
