import 'package:flutter/material.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:localstorage/localstorage.dart';

class StorageCore {
  final storage = LocalStorage('local_data.json');

  Future<bool> ensureStorageReady() async {
    return await storage.ready;
  }

  Future<LoginModel?> getLoginState() async {
    try {
      bool isStorageReady = await storage.ready;
      debugPrint('storage ready? $isStorageReady');
      if (isStorageReady) {
        Map<String, dynamic> data = storage.getItem('auth_result');
        LoginModel auth = LoginModel.fromJson(data);
        debugPrint('Already login');
        return auth;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('error get login state: $e');
      return null;
    }
  }

  Future saveAuthResponse(LoginModel? loginModel) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem('auth_result', loginModel?.toJson());
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  Future deleteAuthResponse() async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem('auth_result');
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  String? getAccessToken() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.token;
    } catch (e) {
      debugPrint("Error while load access token: $e");
      return 'token_not_loaded';
    }
  }

  int? getCurrentUserId() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.client?.id;
    } catch (e) {
      debugPrint("Error while load user_id: $e");
      return 0;
    }
  }

  String? getCurrentUserName() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.nama);
      debugPrint(auth.data?.token);
      return auth.data?.nama.toString();
    } catch (e) {
      debugPrint("Error while load user_name: $e");
      return 'user_name_not_loaded';
    }
  }

  String? getCurrentUserMail() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.email);
      debugPrint(auth.data?.token);
      return auth.data?.email.toString();
    } catch (e) {
      debugPrint("Error while load user_mail: $e");
      return 'user_mail_not_loaded';
    }
  }

  String? getCurrentUserRole() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.role);
      debugPrint(auth.data?.token);
      return auth.data?.role.toString();
    } catch (e) {
      debugPrint("Error while load user_role: $e");
      return 'user_role_not_loaded';
    }
  }

  String? getCurrentUserImg() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.image);
      debugPrint(auth.data?.token);
      return auth.data?.image.toString();
    } catch (e) {
      debugPrint("Error while load user_image: $e");
      return 'user_image_not_loaded';
    }
  }

  Future saveObject(dynamic object, String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem(key, object);
      }
    } catch (e) {
      debugPrint('error save$key : $e');
      rethrow;
    }
  }

  Future removeObject(String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem(key);
      }
    } catch (e) {
      debugPrint('error removing$key : $e');
      rethrow;
    }
  }
}