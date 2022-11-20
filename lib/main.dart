import 'package:flutter/material.dart';
import 'package:jahitkeeun/binding/global_bindings.dart';
import 'package:jahitkeeun/jahitkeeun.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const Jahitkeeun());
}


