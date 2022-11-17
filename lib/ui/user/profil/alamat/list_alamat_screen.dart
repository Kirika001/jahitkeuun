import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';

class AlamatScreen extends StatelessWidget {
  const AlamatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        title: Text('Alamat'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/tambahAlamat'),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => ListTile(
          title: Text('Alamat ${index + 1}'),
          onTap: () => Get.toNamed('/editAlamat'),
        ),
      ),
    );
  }
}
