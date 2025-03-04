import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? jwtToken;

  @override
  void initState() {
    super.initState();
    _saveTemporaryToken();  // 임시 토큰 저장
    _checkToken();  // 앱 실행 시 토큰 확인
  }

  // 임시 토큰 저장 함수
  Future<void> _saveTemporaryToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', 'your-temp-jwt-token');  // 임시 토큰 설정
  }

  // shared_preferences에서 토큰을 가져오는 함수
  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jwtToken = prefs.getString('jwt');  // 저장된 JWT 토큰 가져오기
    });
  }

  // 로그아웃 처리
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('jwt');  // JWT 토큰 삭제
    setState(() {
      jwtToken = null;  // 상태 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            jwtToken != null && jwtToken!.isNotEmpty
                ? Column(
                    children: [
                      Icon(Icons.account_circle, size: 100),
                      SizedBox(height: 20),
                      Text(
                        '사용자 이름: 홍길동',  // 임시 사용자 데이터
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '사용자 이메일: example@email.com',  // 임시 이메일
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _logout,  // 로그아웃 처리
                        child: Text('로그아웃'),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 로그인 버튼 클릭 시 처리
                        },
                        child: Text('로그인'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // 회원가입 버튼 클릭 시 처리
                        },
                        child: Text('회원가입'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
