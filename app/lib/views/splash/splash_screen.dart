import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart'; // SplashController import
import 'splash_widgets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SplashController를 연결
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SplashLogo(), // 로고 위젯
      ),
    );
  }
}
