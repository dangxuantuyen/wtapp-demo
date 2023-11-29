import 'package:clima_app/app/modules/home/controllers/home_controller.dart';
import 'package:clima_app/app/modules/home/views/widget/formsignin_widget.dart';
import 'package:clima_app/app/modules/home/views/widget/toptitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      // color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopTitle(
              textTitle: "WEATHER APP",
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            FormSignin(),
          ],
        ),
      ),
    );
  }
}
