import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:clima_app/app/modules/home/views/screens/signin_screen.dart';

import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SafeArea(child: SigninScreen()),
    );
  }
}
