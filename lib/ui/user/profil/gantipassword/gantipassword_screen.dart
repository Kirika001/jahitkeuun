import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/data/storage_core.dart';

class GantiPasswordScreen extends StatelessWidget {
  const GantiPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
      ),
      body: InAppWebView(
        onLoadStart: (controller, url) async {
          debugPrint(url.toString());
        },
        initialUrlRequest: URLRequest(
          // url: Uri.parse("https://jahitkeeun-fe.vercel.app/app/profil/editpw/${Get.find<StorageCore>().getCurrentUserId()}"),
          url: Uri.parse("https://jahitkeeun-fe.vercel.app"),
          // method: "POST",
          // body: Uint8List.fromList(utf8.encode("")),
          // headers: {
          //   "Accept": "application/json",
            // "Authorization": "Bearer ${Get.find<StorageCore>().getAccessToken()}"
          // },
        ),
      ),
    );
  }
}
