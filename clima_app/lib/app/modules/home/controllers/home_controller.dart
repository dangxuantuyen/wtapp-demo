import 'dart:convert';

import 'package:clima_app/app/modules/home/views/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  double? latitude;
  double? longtitude;
  // Position? currenLocation;
  TextEditingController emailEdittingController = TextEditingController();
  TextEditingController passWordEdittingController = TextEditingController();
  TextEditingController searchEdittingController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool showPassword = false.obs;
  final _googleSignin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  final _googleAccount = Rx<GoogleSignInAccount?>(null);
  final String apiKey = "85bed4ee26f12d3e3a7ea45be4315812";

  //get weather
  Future<void> getWeather() async {
    String apiUrl =
        "api.openweathermap.org/data/2.5/weather?lat=16.030132&lon=108.254070&appid=$apiKey";
    var reponse = await http.get(Uri.parse(apiUrl));
    print(reponse.statusCode);
    if (reponse.statusCode == 200) {
      var json = jsonDecode(reponse.body);
    } else {}
  }

  // togglepassword
  void togglePassword() {
    showPassword.value = !showPassword.value;
  }

  //sigin with google
  Future<void> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? _googleAccount = await _googleSignin.signIn();
      if (_googleAccount == null) {
        print("nodata");
      } else {
        // _googleAccount.displayName;
        Get.to(() => HomePageScreen());
      }
      // final logingg = await _googleSignin.signIn();
      // if (_googleAccount == null) {
      //   print("no data");
      // } else {
      //   print("ok");
      //   _googleAccount.value?.displayName ?? "";
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  //getLocation
  // void getLocation() async {
  Future<Position> getLocation() async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    LocationPermission permission;
    //yêu câuf cho phép lần đầu tiên
    permission = await Geolocator.checkPermission();
    //if denied(tu choi)
    if (permission == LocationPermission.denied) {
      //yeu cau cap quyen
      permission = await Geolocator.requestPermission();
      // if forever denied
      if (permission == LocationPermission.denied) {
        // return print("Location permissions are denied");
        return Future.error("Location permissions are denied");
      }
    }
    // if forever denied
    if (permission == LocationPermission.deniedForever) {
      return
          // print("Location permissions are permanently denied, we cannot request permissions.");
          Future.error(
              "Location permissions are permanently denied, we cannot request permissions.");
    }
    // return await Geolocator.getCurrentPosition();
    return
        // Position position = await Geolocator.getCurrentPosition(
        //     desiredAccuracy: LocationAccuracy.high);

        await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // await position;
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // print(position);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // togglePassword();
  }

  @override
  void onReady() {
    super.onReady();
    togglePassword();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  ///
  ///func
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///.....
  ///
}
