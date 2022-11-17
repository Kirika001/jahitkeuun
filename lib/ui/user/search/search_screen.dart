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
            hintText: 'Cari Penjahit',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search)
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
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
