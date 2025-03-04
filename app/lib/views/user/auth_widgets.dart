import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';  // 추가

class AuthWidget extends StatefulWidget {
  final VoidCallback onLogin;
  final VoidCallback onSignup;

  AuthWidget({required this.onLogin, required this.onSignup});

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 로그인 요청 함수
  Future<void> _login() async {
    // .env 파일에서 API_URL을 가져옴
    // String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:8000';
    String apiUrl = 'http://10.0.2.2:8000';
    print(apiUrl);

    // 로그인 요청 본문 생성
    Map<String, String> requestBody = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      print(response);

      if (response.statusCode == 201) {
        // 로그인 성공 시
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        if (responseBody['loginUser'] != null) {
          String userEmail = responseBody['loginUser']['email'];
          print("로그인 성공: $userEmail");

          // 로그인 성공 후 상태 갱신
          setState(() {
            // 로그인 후 추가적인 상태 업데이트가 필요할 경우 여기에 작성
          });

          // 이메일을 토스트로 보여줌
          Fluttertoast.showToast(
            msg: '로그인 성공: $userEmail',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          // loginUser가 null일 경우 에러 처리
          Fluttertoast.showToast(
            msg: '로그인 실패: 사용자 정보가 존재하지 않습니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        // 로그인 실패 시
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        String errorMessage = errorResponse['message'] ?? '알 수 없는 오류 발생';

        // 실패 메시지를 토스트로 보여줌
        Fluttertoast.showToast(
          msg: '로그인 실패: $errorMessage',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      // 네트워크 에러 등 예외 처리
      Fluttertoast.showToast(
        msg: '오류 발생: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이메일 입력 필드
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),  
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: '이메일',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 20),

        // 비밀번호 입력 필드
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),  
          child: TextField(
            controller: _passwordController,
            obscureText: true,  // 비밀번호 숨기기
            decoration: InputDecoration(
              labelText: '비밀번호',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 20),

        // 로그인 버튼
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),  
          child: ElevatedButton(
            onPressed: _login,  // 로그인 함수 호출
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),  
              backgroundColor: Color(0xFF020403),
              foregroundColor: Colors.white,
            ),
            child: Text(
              '로그인',
              style: TextStyle(fontSize: 18),  
            ),
          ),
        ),

        SizedBox(height: 10),

        // 연한 선
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),  
          child: Divider(
            color: Color(0xFF020403),
            thickness: 1,
          ),
        ),

        SizedBox(height: 10), 

        // 회원가입 버튼
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),  
          child: ElevatedButton(
            onPressed: widget.onSignup,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),  
              elevation: 0,  
              side: BorderSide(color: Color(0xFF020403), width: 2),  
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF020403), 
            ),
            child: Text(
              '회원가입',
              style: TextStyle(fontSize: 18),  
            ),
          ),
        ),
      ],
    );
  }
}
