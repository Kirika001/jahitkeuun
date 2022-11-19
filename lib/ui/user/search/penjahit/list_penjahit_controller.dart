import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/tailor_byitemid_model.dart';

class ListPenjahitController extends BaseController{
  TailorByitemidModel? tailorByitemid;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    penjahit();
  }

  void penjahit() async{
    isLoading = true;
    try{
      var response = await repository.getTailorByitemid(storage.getAccessToken() ?? '', Get.arguments);
      tailorByitemid = response;
      isLoading = false;
      update();
    } catch (e){
      return e.printError();
    }
  }
}