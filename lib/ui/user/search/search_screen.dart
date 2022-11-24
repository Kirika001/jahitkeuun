import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/card_tailor.dart';
import 'package:jahitkeeun/ui/user/search/search_controller.dart';
import 'package:jahitkeeun/data/model/search_tailor_model.dart' as search;

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
                  onSubmitted: (value) async {
                    controller.updateSearchTerm(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, left: 10),
                    hintText: 'Cari Penjahit',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          controller.updateSearchTerm(
                              controller.searchController.text);
                        }),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () => Get.toNamed('/keranjang'),
                      icon: const Icon(Icons.shopping_cart))
                ],
              ),
              body: PagedListView(
                  shrinkWrap: true,
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<search.Data1?>(
                    firstPageErrorIndicatorBuilder: (context) => const SizedBox.shrink(),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const SizedBox.shrink(),
                    itemBuilder: (context, searchData, index) {
                      return TailorCard(
                        photo: '${searchData?.taylorPhoto}',
                        idPenjahit: int.parse(searchData?.taylorId ?? '0'),
                        namaPenjahit: searchData?.taylorName ?? '',
                        lokasiPenjahit: searchData?.districtName,
                        rating: double.parse(searchData?.taylorRating ?? '0'),
                      );
                    },
                  ))
              // body: ListView.builder(
              //     itemCount: controller.listSearch.length,
              //     itemBuilder: (context, index) {
              //       return TailorCard(
              //         photo: '${controller.listSearch[index].taylorPhoto}',
              //         idPenjahit: int.parse(
              //             controller.listSearch[index].taylorId ?? '0'),
              //         namaPenjahit:
              //             controller.listSearch[index].taylorName ?? '',
              //         lokasiPenjahit: controller.listSearch[index].districtName,
              //         rating: double.parse(
              //             controller.listSearch[index].taylorRating ?? '0'),
              //       );
              //     })
              );
        });
  }
}
