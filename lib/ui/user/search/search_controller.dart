import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/search_tailor_model.dart' as search;

class SearchController extends BaseController{
  final searchController = TextEditingController();
  search.SearchTailorModel? searchTailorModel;

  bool isLoading = false;
  bool showSearch = false;
  List<search.Data1> listSearch = [];

  @override
  void onInit() {
    super.onInit();
    searchController.text;
    update();
  }

  @override
  void dispose() {
    super.dispose();

    searchController.dispose();
  }


  Future<void> fetchSearch(String tailorName) async {
    isLoading = true;
    listSearch.clear();
    update();
    try {
      var cari = await repository.searchTailor(storage.getAccessToken() ?? '', searchController.text);
      searchTailorModel = cari;
      print(cari!.meta?.message);
      listSearch.addAll(cari!.data?.data?.toSet().toList() ?? []);

      isLoading = false;
      update();
    } on DioError catch(e) {
      debugPrint(e.response?.data.toString());
    }
  }
}