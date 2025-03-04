import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomAppBar({this.height = 40.0}); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, 
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(  
          alignment: Alignment.centerLeft, 
          child: Container(
            width: 100.0, 
            height: height,
            margin: EdgeInsets.only(top: 30.0),
            child: Image.asset(
              'assets/images/splash_logo.png',
              fit: BoxFit.contain, 
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0), 
        child: Container(
          color: Color(0xFFD0D0D0), 
          height: 1.0,  
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
