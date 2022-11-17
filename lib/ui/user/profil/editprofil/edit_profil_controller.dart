import 'package:get/get.dart';
import 'dart:io';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jahitkeeun/data/storage_core.dart';

class EditProfilController extends BaseController{

  String? token = StorageCore().getAccessToken();
  File? gettedPhoto;

  @override
  void onInit() {
    super.onInit();
  }

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      gettedPhoto = file;
      update();
    } else {
      // User canceled the picker
    }
  }
}