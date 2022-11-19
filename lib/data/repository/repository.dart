import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jahitkeeun/data/model/category_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/model/register_model.dart';
import 'package:jahitkeeun/data/model/tailor_byitemid_model.dart';
import 'package:jahitkeeun/data/model/tailor_detail_model.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart';

abstract class Repository{
  FutureOr<RegisterModel?> postRegister(String name, String email, String password);
  FutureOr<LoginModel?> postLogin(String email, String password);
  FutureOr<LogoutModel> postLogout(String token);
  FutureOr<CategoryModel?> getCategory(String token);
  FutureOr<TailorModel?> getTailor(String token);
  FutureOr<TailorDetailModel?> getTailorDetail(String token, int id);
  FutureOr<CurrentAddressModel?> getCurrentAddress(String token, int userID);
  FutureOr<TailorByitemidModel?> getTailorByitemid(String token, int itemID);

}