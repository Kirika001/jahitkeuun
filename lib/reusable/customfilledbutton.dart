import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color color;
  final Color? borderColor;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomFilledButton(
      {Key? key,
      this.title = '',
      this.width = double.infinity,
      this.height = 50,
      this.icon,
      required this.color,
      this.onPressed,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.greenAccent
              )
          ),
        ),
        child: Text(
          title,
          style: mainTextStyle.copyWith(
              color: lightColor, fontWeight: FontWeight.w900, fontSize: 16),
        ),
      ),
    );
  }
}
