import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('사용자 화면'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 100),
            SizedBox(height: 20),
            Text(
              '사용자 이름: 홍길동',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '사용자 이메일: example@email.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 로그아웃 혹은 다른 작업 처리
              },
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
