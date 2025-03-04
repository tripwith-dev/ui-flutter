import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'home_widgets.dart';
import '../user/user_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // appBar: AppBar( 
      //   title: Text('홈 화면'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeTitle(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 원하는 작업
              },
              child: Text("클릭"),
            ),
          ],
        ),
      ),
    );
  }
}
