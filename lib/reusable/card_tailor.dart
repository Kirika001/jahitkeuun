import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class TailorCard extends StatelessWidget {
  const TailorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: darkColor, borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              profilImg,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Penjahit',
                style: titleTextStyle,
              ),
              Text(
                'lokasi',
                style: subtitleTextStyle,
              ),
              Row(
                children: [
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
                  Text('(26)')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
