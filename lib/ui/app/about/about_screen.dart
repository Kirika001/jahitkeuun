import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/ui/app/about/about_controller.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
      init: AboutController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tentang Kami'),
          ),
          // body: controller.aboutWebview(context),
          body: Center(
            child: HtmlWidget(
              '<iframe src="https://jahitkeeun-fe.vercel.app/"></iframe>',
              factoryBuilder: () => MyWidgetFactory(),
            ),
          ),
        );
      }
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
