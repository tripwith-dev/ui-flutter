import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String username;
  final String email;
  final VoidCallback onLogout;

  ProfileWidget({required this.username, required this.email, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.account_circle, size: 100),
        SizedBox(height: 20),
        Text(
          '사용자 이름: $username',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          '사용자 이메일: $email',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: onLogout,  // 로그아웃 처리
          child: Text('로그아웃'),
        ),
      ],
    );
  }
}
