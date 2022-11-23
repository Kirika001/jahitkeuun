import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jahitkeeun/base/base_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutController extends BaseController{

  @override
  void onInit() {
    super.onInit();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  // @override
  // Widget aboutWebview(BuildContext context) {
  //   return WebView(
  //     initialUrl: 'https://jahitkeeun-fe.vercel.app/',
  //   );
  // }

}