import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/ui/user/search/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: lightColor,
          appBar: AppBar(
            title: TextField(
              controller: controller.searchController,
              onSubmitted: (value) {
                controller.fetchSearch(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15, left: 10),
                hintText: 'Cari Penjahit',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () => Get.toNamed('/keranjang'),
                  icon: Icon(Icons.shopping_cart)
              )
            ],
          ),
          body: ListView.builder(
              itemCount: controller.searchTailorModel?.data?.data?.length,
              itemBuilder: (context, index){
                return TailorCard();
              })
        );
      }
    );
  }
}
