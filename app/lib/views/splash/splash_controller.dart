import 'package:get/get.dart';
import '../home/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => HomeScreen()); // 3초 후 홈 화면으로 이동
    });
  }
}
