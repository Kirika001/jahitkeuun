import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';

class TailorCard extends StatelessWidget {
  final String? fotoProfil;
  final String? namaPenjahit;
  final String? lokasiPenjahit;
  final double? rating;
  final int? totalOrder;
  final VoidCallback? onTap;
  final Color? color;
  final double? elevation;

  const TailorCard({
    Key? key,
    this.fotoProfil =
        'https://images.pexels.com/photos/5704849/pexels-photo-5704849.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    this.namaPenjahit = 'Nanami',
    this.lokasiPenjahit = 'lokasi',
    this.rating = 3.5,
    this.totalOrder = 30,
    this.onTap,
    this.color = Colors.white,
    this.elevation = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: elevation,
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
                fotoProfil!,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaPenjahit!,
                  style: titleTextStyle,
                ),
                Text(
                  lokasiPenjahit!,
                  style: subtitleTextStyle,
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: rating!,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    Text('(${totalOrder})')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
