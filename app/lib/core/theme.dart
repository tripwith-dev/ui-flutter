import 'package:flutter/material.dart';

class AppTheme {
  // 기본 테마 설정
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFF020403), // 앱의 주요 색상
    scaffoldBackgroundColor: Colors.white, // 기본 배경색
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white, // 앱바 배경색
      elevation: 0, // 앱바 그림자 없애기
      titleTextStyle: TextStyle(
        color: Color(0xFF020403), // 앱바 텍스트 색상
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF020403)), // 본문 텍스트 기본 색상
      bodyMedium: TextStyle(color: Color(0xFF020403)), // 추가적인 본문 텍스트 스타일
      bodySmall: TextStyle(color: Color(0xFF020403)),  // 작은 텍스트 스타일
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF020403), // 버튼 색상
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // 버튼 모서리 둥글게
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF020403), // 아이콘 색상
    ),
  );

  // 다크 모드 설정 
  static ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xFF020403), // 다크 모드에서의 주요 색상
    scaffoldBackgroundColor: Color(0xFF212121), // 다크 모드 배경색
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF020403), // 앱바 배경색
      titleTextStyle: TextStyle(color: Colors.white), // 앱바 텍스트 색상
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // 다크 모드에서 본문 텍스트 색상
      bodyMedium: TextStyle(color: Colors.white), // 다크 모드에서 추가적인 본문 텍스트 스타일
    ),
  );
}
