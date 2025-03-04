import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash_logo.png', // 로고 이미지
      width: 150,
      height: 150,
    );
  }
}
