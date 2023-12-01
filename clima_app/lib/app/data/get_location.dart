import 'package:geolocator/geolocator.dart';

class GetLocation {
  double? longtitude;
  double? latitude;
  GetLocation({this.latitude, this.longtitude});
  Future<void> getLocation() async {
    try {
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
    } catch (e) {
      print(e.toString());
    }
  }
}
