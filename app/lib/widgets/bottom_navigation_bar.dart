import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/home/home_screen.dart';
import '../views/user/user_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '계정',
        ),
      ],
      onTap: onTap,
      selectedItemColor: Color(0xFF020403),  // 활성화된 아이템 색상
      unselectedItemColor: Color(0xFF888888),  // 비활성화된 아이템 색상
    );
  }
}
