import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_widgets.dart';  // 프로필 위젯
import 'auth_widgets.dart';  // 인증 위젯

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? jwtToken;

  @override
  void initState() {
    super.initState();
    _checkToken();  // 앱 실행 시 토큰 확인
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
                ? ProfileWidget(
                    username: '홍길동',  // 임시 사용자 데이터
                    email: 'example@email.com',  // 임시 이메일
                    onLogout: _logout,
                  )
                : AuthWidget(
                    onLogin: () {
                      // 로그인 버튼 클릭 시 처리
                    },
                    onSignup: () {
                      // 회원가입 버튼 클릭 시 처리
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
