import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jahitkeeun/data/model/add_to_cart_model.dart';
import 'package:jahitkeeun/data/model/category_bytailorid_model.dart';
import 'package:jahitkeeun/data/model/category_model.dart';
import 'package:jahitkeeun/data/model/checkout_model.dart';
import 'package:jahitkeeun/data/model/client_order_model.dart';
import 'package:jahitkeeun/data/model/current_address_model.dart';
import 'package:jahitkeeun/data/model/delete_cart_model.dart';
import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/model/register_model.dart';
import 'package:jahitkeeun/data/model/search_tailor_model.dart';
import 'package:jahitkeeun/data/model/tailor_byitemid_model.dart';
import 'package:jahitkeeun/data/model/tailor_detail_model.dart';
import 'package:jahitkeeun/data/model/tailor_model.dart';
import 'package:jahitkeeun/data/model/tailor_service_model.dart';
import 'package:jahitkeeun/data/model/update_qty_cart_model.dart';
import 'package:jahitkeeun/data/model/user_cart_model.dart';

abstract class Repository{
  FutureOr<RegisterModel?> postRegister(String name, String email, String password);
  FutureOr<LoginModel?> postLogin(String email, String password);
  FutureOr<LogoutModel> postLogout(String token);
  FutureOr<CategoryModel?> getCategory(String token);
  FutureOr<CategoryBytailoridModel> getCategoryTailor(String token, int id);
  FutureOr<TailorServiceModel?> getServiceTailor(String token, int tailorID, itemID);
  FutureOr<TailorModel?> getTailor(String token, int page);
  FutureOr<TailorDetailModel?> getTailorDetail(String token, int id);
  FutureOr<CurrentAddressModel?> getCurrentAddress(String token, int userID);
  FutureOr<TailorByitemidModel?> getTailorByitemid(String token, int itemID);
  FutureOr<AddToCartModel?> postAddCart(String token, int userID, int serviceID, int qty, String pickup, String desc, File photo);
  FutureOr<UserCartModel?> getUserCart(String token, int userID);
  FutureOr<DeleteCartModel?> deleteUserCart(String token, int userID, int serviceID);
  FutureOr<UpdateQtyCartModel?> updateQtyCart(String token, int userID, int serviceID, String qty);
  FutureOr<SearchTailorModel?> searchTailor(String token, String searchName);
  FutureOr<CheckoutModel?> postCheckout(String token, int userID, int amount, String userAddress);
  FutureOr<ClientOrderModel?> getClientOrder(String token, int userID);
}