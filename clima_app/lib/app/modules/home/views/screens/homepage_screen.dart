import 'package:clima_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

// import 'package:CLIMA_APP/app/modules/home/views/widget/search_city.dart';
import 'package:clima_app/app/modules/home/views/widget/search_city.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backgroundweather.avif"),
                    fit: BoxFit.fill)),
          ),

          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: Get.height * 0.1)),
              //search
              SearchCity(controller: controller.searchEdittingController),
              //
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Text(
                "🌤️",
                style: TextStyle(fontSize: 120),
              ),
              //temperature
              Text(
                '37',
                style: GoogleFonts.alef(
                    textStyle:
                        const TextStyle(color: Colors.teal, fontSize: 120)),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              //City
              Text(
                "Da Nang - Viet Nam",
                style: GoogleFonts.langar(
                    textStyle:
                        const TextStyle(color: Colors.orange, fontSize: 30)),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              //Note
              Text(
                "Note...",
                style: GoogleFonts.abyssinicaSil(
                  textStyle: const TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.getLocation();
                  },
                  child: Text("Getlocation"))
              //
            ],
          )
        ],
      ),
    );
  }
}
