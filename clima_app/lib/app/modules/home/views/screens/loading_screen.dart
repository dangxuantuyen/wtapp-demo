import 'package:clima_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.teal),
        child: Center(
          child: Column(
            children: [
              Text("Loading"),
              Icon(Icons.play_arrow_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
