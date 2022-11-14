import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import '';

class CategoryCard extends StatelessWidget {
  final img;
  final title;

  const CategoryCard({Key? key,
    this.img,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      elevation: 3,
      child:  Stack(
          children: [
            Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.network(img, fit: BoxFit.fill)
            ),
            Positioned(
              bottom: 0,
              width: Get.width,
              height: 30,
              child: Container(
                child: Text(' $title', style: subtitleTextStyle.copyWith(fontWeight: FontWeight.bold),),
                decoration:BoxDecoration(
                  color: secondaryColor.withOpacity(0.7)
                ),
              ),
            )
          ],
        ),
    );
  }
}
