import 'package:get/get.dart';
import 'package:notes_application/Views/HomePage/home_page.dart';
import 'package:notes_application/Views/SplashScreen/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String liked = '/liked';

  static List<GetPage> myPages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
  ];
}
