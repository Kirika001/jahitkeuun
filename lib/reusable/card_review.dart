import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profilImg),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Pengguna',
                      style:
                          mainTextStyle.copyWith(fontWeight: FontWeight.bold)),
                  RatingBarIndicator(
                    rating: 5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  Text('Item : Blouse', style: subtitleTextStyle),
                  Text('Deskripsi Review\n'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 100,
                        width: 100,
                        color: darkColor,
                        child: Image.network(
                          profilImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 100,
                        width: 100,
                        color: darkColor,
                        child: Image.network(
                          profilImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 100,
                          width: 40,
                          color: lightGreyColor.withOpacity(0.5),
                          child: Center(child: Text('+2', style: subtitleTextStyle,))),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
