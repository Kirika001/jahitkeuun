import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/temp_img.dart';

class ItemCategory extends StatelessWidget {
  final String? namaCategory;
  final String? imgCategory;


  const ItemCategory({
    Key? key,
    this.namaCategory = 'Blouse',
    this.imgCategory = blouseImg
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imgCategory!),
      title: Text(namaCategory!),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
