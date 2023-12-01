import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/screens/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const pageHome = Routes.homeView;

  static final routes = [
    GetPage(
      // name: _Paths.HOME,
      name: _Paths.pageHome,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
