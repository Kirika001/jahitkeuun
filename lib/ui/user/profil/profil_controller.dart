import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';

class ProfilController extends BaseController{

  LogoutModel? logoutModel;
  String? namaUser;
  String? kontakUser;
  String? emailUser;
  String? roleUser;



  @override
  void onInit() {
    super.onInit();
    namaUser = storage.getCurrentUserName();
    kontakUser = storage.getCurrentUserId().toString();
    emailUser = storage.getCurrentUserMail();
    roleUser = storage.getCurrentUserRole();
  }

  void logout() async{
    // try{
      // var res = await repository.postLogout(storage.getAccessToken().toString());
      // logoutModel = res;
      storage.deleteAuthResponse();
      // Fluttertoast.showToast(msg: res?.meta?.message ?? 'logout gagal');
      Fluttertoast.showToast(msg: 'Logout Berhasil');
      // if (res?.meta?.code == 200) {
        Get.offAllNamed('/login');
      // }
    // } catch(e){
    //   e.printError();
    // }
  }
}