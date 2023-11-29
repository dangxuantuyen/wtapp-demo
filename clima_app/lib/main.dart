import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:clima_app/app/modules/home/bindings/home_binding.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.HomeBinding;
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
