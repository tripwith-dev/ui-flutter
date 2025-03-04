import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/splash/splash_screen.dart';
import 'views/home/home_screen.dart';
import 'views/user/user_screen.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenWrapper(), 
      theme: AppTheme.lightTheme, // lightTheme 설정
      title: "Trip With",
    );
  }
}

class HomeScreenWrapper extends StatefulWidget {
  @override
  _HomeScreenWrapperState createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),  // 공통 AppBar
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // 첫 번째 화면: HomeScreen
          HomeScreen(),
          // 두 번째 화면: UserScreen
          UserScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);  // 페이지 이동
        },
      ),
    );
  }
}
