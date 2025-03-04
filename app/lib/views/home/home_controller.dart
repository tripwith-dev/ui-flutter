import 'package:get/get.dart';

class HomeController extends GetxController {
  void onButtonPressed() {
    Get.snackbar("알림", "버튼이 클릭되었습니다!");
  }
}
