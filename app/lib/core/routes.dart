import 'package:get/get.dart';
import '../views/splash/splash_screen.dart';
import '../views/home/home_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
  ];
}
