import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/storage_core.dart';

class ProfilController extends BaseController{
  final storage = StorageCore();

  LogoutModel? logoutModel;


  @override
  void onInit() {
    super.onInit();

  }

  void logout() async{
    try{
      var res = await repository.postLogout(storage.getAccessToken().toString());
      logoutModel = res;
      storage.deleteAuthResponse();
      Fluttertoast.showToast(msg: res?.meta?.message ?? 'logout gagal');
      if (res?.meta?.code == 200) {
        Get.offAllNamed('/login');
      }
    } catch(e){
      e.printError();
    }
  }
}