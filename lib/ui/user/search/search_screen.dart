import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15, left: 10),
            hintText: 'Cari Penjahit',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search)
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed('/keranjang'),
              icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: ListView(
          children: [
            TailorCard(
              onTap: ()=> Get.toNamed('detilPenjahit'),
            ),
            TailorCard(),
            TailorCard(),
            TailorCard(),
          ],
      ),
    );
  }
}
