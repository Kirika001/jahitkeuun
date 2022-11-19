import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/ui/user/search/penjahit/list_penjahit_controller.dart';

class ListPenjahitScreen extends StatelessWidget {
  const ListPenjahitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListPenjahitController>(
        init: ListPenjahitController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: lightColor,
            appBar: AppBar(
              title: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15, left: 10),
                    hintText: 'Cari Penjahit',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search)),
              ),
              actions: [
                IconButton(
                    onPressed: () => Get.toNamed('/keranjang'),
                    icon: Icon(Icons.shopping_cart))
              ],
            ),
            body: controller.isLoading == false
                ? RefreshIndicator(
                  onRefresh: () async=> controller.penjahit(),
                  child: ListView.builder(
                      itemCount: controller.tailorByitemid!.data!.data!.length,
                      itemBuilder: (context, index) => TailorCard(
                        idPenjahit: int.parse(controller.tailorByitemid!.data!.data![index].taylorId ?? '0')   ,
                        namaPenjahit: controller.tailorByitemid!.data!.data![index].taylorName,
                        lokasiPenjahit: controller.tailorByitemid!.data!.data![index].kota,
                        rating: double.parse(controller.tailorByitemid!.data!.data![index].rating ?? ''),
                      ),
                    ),
                )
                : Center(child: CircularProgressIndicator.adaptive()),
          );
        });
  }
}
