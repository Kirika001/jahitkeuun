import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color color;
  final Color? borderColor;
  final Color? fontColor;
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
      this.borderColor = Colors.white,
      this.fontColor = whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: fontColor,
                  )
                : Container(),
            title != null
                ? Text(
                    ' $title',
                    style: mainTextStyle.copyWith(
                        color: fontColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
