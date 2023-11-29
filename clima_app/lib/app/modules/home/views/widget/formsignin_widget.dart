import 'package:clima_app/app/modules/home/controllers/home_controller.dart';
import 'package:clima_app/app/modules/home/views/widget/textformfield_password.dart';
import 'package:clima_app/app/modules/home/views/widget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
            const SizedBox(
              height: 30,
            ),
            //email
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextFormFieldWidget(
                  controller: controller.emailEdittingController,
                  hintTextFormField: "Email"),
            ),
            //Password
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextFormFieldWidgetPassword(
                obscureText: controller.showPassword.value,
                controller: controller.passWordEdittingController,
                hintTextFormField: "Password",
                suffixIcon: Obx(
                    // () => GestureDetector(
                    //   onTap: () {
                    //     controller.ShowPassword();
                    //   },
                    //   child: Icon(
                    //     controller.showPassword.value
                    //         ? Icons.visibility
                    //         : Icons.visibility_off,
                    //     color: Colors.red,
                    //   ),
                    // ),
                    () => IconButton(
                        onPressed: () => controller.togglePassword(),
                        icon: Icon(
                          controller.showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.red,
                        ))),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("For got Password")),
            ),
            ElevatedButton(
              onPressed: () {
                controller.signinWithGoogle();
              },
              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}
