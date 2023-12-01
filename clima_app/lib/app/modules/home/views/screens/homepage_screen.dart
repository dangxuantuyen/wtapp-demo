import 'package:clima_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

// import 'package:CLIMA_APP/app/modules/home/views/widget/search_city.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen(
      {super.key,
      this.description,
      this.temp,
      this.cityName,
      this.iconWeather,
      this.main});
  final HomeController controller = Get.find();
  final String? description, cityName, iconWeather, main;
  final int? temp;
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

          Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: Get.height * 0.1)),
                //search
                //
                SizedBox(
                  height: Get.height * 0.07,
                ),
                Text(
                  // "🌤️",
                  "$description",
                  style: const TextStyle(fontSize: 50, color: Colors.yellow),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //temperature
                Text(
                  "$temp °C",
                  style: GoogleFonts.alef(
                      textStyle:
                          const TextStyle(color: Colors.teal, fontSize: 70)),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //main
                Text(
                  "$main",
                  style: GoogleFonts.alef(
                      textStyle:
                          const TextStyle(color: Colors.teal, fontSize: 70)),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //City
                Text(
                  "$cityName ",
                  style: GoogleFonts.langar(
                      textStyle:
                          const TextStyle(color: Colors.orange, fontSize: 50)),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(
                  height: Get.height * 0.07,
                  width: Get.width * 0.5,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.signOut();
                      },
                      child: const Text(
                        "Sign out",
                        style: TextStyle(fontSize: 23, color: Colors.brown),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
