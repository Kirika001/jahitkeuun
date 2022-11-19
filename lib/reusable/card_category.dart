import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import '';

class CategoryCard extends StatelessWidget {
  final img;
  final title;
  final VoidCallback? onTap;

  const CategoryCard({Key? key, this.img, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        color: darkColor,
        elevation: 3,
        child: Container(
            padding: EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: darkColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Image.network(
                  img,
                  height: 60,
                  width: 60,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    ' $title',
                    style: subtitleTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
