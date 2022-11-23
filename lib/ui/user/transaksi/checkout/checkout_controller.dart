import 'package:get/get.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:jahitkeeun/data/model/user_cart_model.dart' as cart;
import 'package:jahitkeeun/data/model/current_address_model.dart' as address;

class CheckoutController extends BaseController{
  List<cart.Data1> items = Get.arguments['listItem'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    items;
  }

}