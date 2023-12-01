import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:clima_app/app/modules/home/bindings/home_binding.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.HomeBinding;
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.pageHome,
      getPages: AppPages.routes,
    ),
  );
}
