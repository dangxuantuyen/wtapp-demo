import 'dart:convert';

import 'package:clima_app/app/data/weather.dart';
import 'package:clima_app/app/modules/home/views/screens/homepage_screen.dart';
import 'package:clima_app/app/modules/home/views/screens/signin_screen.dart';
import 'package:clima_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var weatherData = <WeatherData>[].obs;

  double? latitude;
  double? longtitude;
  String? cityName;

  // String? description;
  String? urlhttp;
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

  // Rx<GoogleSignInAccount?> _googleAccount = Rx<GoogleSignInAccount?>(null);
  final String apiKey = "85bed4ee26f12d3e3a7ea45be4315812";
  final String urlWeather = "https://api.openweathermap.org/data/2.5/weather";

  //get weather
  // Future<void> getWeather() async {
  //   String apiUrl =
  //       // "api.openweathermap.org/data/2.5/weather?lat=16.030132&lon=108.254070&appid=$apiKey";
  //       "api.openweathermap.org/data/2.5/weather?lat=16.030132&lon=108.254070&appid=$apiKey";
  //   var reponse = await http.get(Uri.parse(apiUrl));
  //   print(reponse.statusCode);
  //   if (reponse.statusCode == 200) {
  //     var json = jsonDecode(reponse.body);
  //   } else {
  //     print(reponse.statusCode);
  //   }
  // }

  // togglepassword
  void togglePassword() {
    showPassword.value = !showPassword.value;
  }

  //sigin with google
  Future<void> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleAccount = await _googleSignin.signIn();
      if (googleAccount == null) {
        print("nodata");
      } else {
        // Get.to(() => HomePageScreen());
        Get.toNamed(Routes.homeView);
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
      return Future.error(
          "Location permissions are permanently denied, we cannot request permissions.");
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    longtitude = position.longitude;
    latitude = position.latitude;
    print("long = ${position.longitude} lat= ${position.latitude}");
    //get weather
    String urlApiWeather =
        "$urlWeather?lat=$latitude&lon=$longtitude&appid=$apiKey";
    var reponse = await http.get(Uri.parse(urlApiWeather));
    print(reponse.statusCode);
    if (reponse.statusCode == 200) {
      var jsonData = jsonDecode(reponse.body);
      final res = WeatherData.fromJson(jsonData);
      double? tempdouble = res.main?.temp;
      String? main = res.weather![0].main;
      String? description = res.weather![0].description;

      String? cityName = res.name;
      print(weatherData);
      // double tempdouble = jsonDecode(jsonData)["main"]["temp"];
      double change = (tempdouble! - 32 * 0.555) * 0.1;
      int temp = change.toInt();
      print(weatherData);
      // print(temp);
      print(cityName);
      // print(description);
      Get.to(
        () => HomePageScreen(
          description: description,
          temp: temp,
          cityName: cityName,
          // iconWeather: iconWeather,
          main: main,
        ),
      );
    } else {
      print(reponse.statusCode);
    }
    return position;
  }

  //signout
  Future<void> signOut() async {
    await _googleSignin.signOut();
    Get.offAll(() => SigninScreen());
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getLocation();

    // togglePassword();
  }

  @override
  void onReady() {
    super.onReady();
    togglePassword();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
