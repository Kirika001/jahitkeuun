import 'dart:async';
import 'dart:io';

import 'package:jahitkeeun/data/model/login_model.dart';
import 'package:jahitkeeun/data/model/logout_model.dart';
import 'package:jahitkeeun/data/model/register_model.dart';

abstract class Repository{
  FutureOr<RegisterModel?> postRegister(String name, String email, String password);
  FutureOr<LoginModel?> postLogin(String email, String password);
  FutureOr<LogoutModel> postLogout(String token);

}