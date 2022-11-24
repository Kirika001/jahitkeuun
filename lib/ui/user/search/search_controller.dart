import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/search_tailor_model.dart' as search;

class SearchController extends BaseController {
  final searchController = TextEditingController();
  search.SearchTailorModel? searchTailorModel;

  bool isLoading = false;
  bool showSearch = false;
  List<search.Data1> listSearch = [];

  String? searchTerm;

  final PagingController<int, search.Data1> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchSearch(pageKey);
    });
    super.onInit();
  }

  void updateSearchTerm(String searchTerm) {
    this.searchTerm = searchTerm;
    pagingController.refresh();
  }

  @override
  void dispose() {
    pagingController.dispose();
    searchController.dispose();
    super.dispose();
  }

  // Future<void> fetchTaylor(int page) async {
  //   try {
  //     var tailor = await repository.getTailor(storage.getAccessToken() ?? '', page);
  //     // tailorModel = tailor;
  //
  //     var isLastPage = page >= tailor!.data!.lastPage!;
  //     debugPrint("isLastPage $isLastPage, ${tailor.data?.lastPage!} $page}");
  //     if (isLastPage){
  //       pagingController.appendLastPage(tailor.data!.data!);
  //     } else  {
  //       final nextPageKey = page + 1;
  //       pagingController.appendPage(tailor.data!.data!, nextPageKey);
  //     }
  //     update();
  //   } on DioError catch(e) {
  //     debugPrint(e.response?.data.toString());
  //   }
  // }

  Future<void> fetchSearch(int page) async {
    try {
      var cari = await repository.searchTailor(
          storage.getAccessToken() ?? '', searchTerm, page);
      var isLastPage = page >= cari!.data!.lastPage!;
      debugPrint("isLastPage $isLastPage, ${cari.data?.lastPage!} $page");
      if (isLastPage) {
        pagingController.appendLastPage(cari.data!.data!);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(cari.data!.data!, nextPageKey);
      }
      update();
    } catch (e) {
      pagingController.error = e;
    }
  }
}
