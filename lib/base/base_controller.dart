import 'package:get/get.dart';
import 'package:jahitkeeun/data/network_core.dart';
import 'package:jahitkeeun/data/repository/repository.dart';

class BaseController extends GetxController {
  NetworkCore networkCore = Get.find<NetworkCore>();
  Repository repository = Get.find<Repository>();

}