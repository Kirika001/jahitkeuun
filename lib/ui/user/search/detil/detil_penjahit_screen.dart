import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/const/temp_img.dart';
import 'package:jahitkeeun/const/textstyle.dart';
import 'package:jahitkeeun/reusable/card_review.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/reusable/item_category.dart';

class DetilPenjahitScreen extends StatelessWidget {
  const DetilPenjahitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detil Penjahit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TailorCard(
              color: Colors.transparent,
              elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: 'Deskripsi Penjahit ${lorem}',
                      style: mainTextStyle.copyWith(color: darkColor))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFilledButton(
                    width: Get.width / 2 - 20,
                    height: 40,
                    color: darkColor,
                    title: 'Chat',
                  ),
                  CustomFilledButton(
                    width: Get.width / 2 - 20,
                    height: 40,
                    color: Colors.transparent,
                    fontColor: darkColor,
                    borderColor: darkColor,
                    title: 'Lihat Portofolio',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomFilledButton(
                title: 'Pesan Jasa',
                color: mainColor,
                onPressed: ()=> Get.toNamed('/pesanJasa'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('Jassa Nanami Tailor', style: titleTextStyle),
            ),
            ItemCategory(),
            ItemCategory(namaCategory: 'Kemeja', imgCategory: kemejaImg),
            ItemCategory(namaCategory: 'Rok', imgCategory: skirtImg),
            ItemCategory(namaCategory: 'Celana', imgCategory: pantImg),
            ItemCategory(namaCategory: 'Kerudung', imgCategory: kerudungImg),
            ItemCategory(namaCategory: 'Gamis', imgCategory: gamisImg),
            ItemCategory(
                namaCategory: 'Dress Pendek', imgCategory: dressminImg),
            TextButton(
                onPressed: () {},
                child: Text("Lihat Jasa Lainnya",
                    style: mainTextStyle.copyWith(color: darkColor))),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('Review', style: titleTextStyle),
            ),
            ReviewCard()
          ],
        ),
      ),
    );
  }
}
