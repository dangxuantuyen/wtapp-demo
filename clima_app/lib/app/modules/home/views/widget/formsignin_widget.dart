import 'package:clima_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormSignin extends StatelessWidget {
  FormSignin({
    super.key,
  });

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //title
            Text("lOGIN",
                style:
                    GoogleFonts.abel(textStyle: const TextStyle(fontSize: 30))),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Container(
              height: Get.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  controller.signinWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Image(
                            image:
                                AssetImage("assets/images/icon_google.png"))),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    const Text(
                      "Sign In With Google",
                      style: TextStyle(fontSize: 23),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
