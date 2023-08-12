import 'package:budget_app/views/add_category_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: '/', page: () => Add_Category())],
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
    ),
  );
}
