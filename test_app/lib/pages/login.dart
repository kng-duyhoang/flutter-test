import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/apis/base_api.dart';
import 'package:test_app/apis/models/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _onPressed () async {
    final url = Uri.parse(ApiUrl.baseUrl + '/user/login');
    final user = ModelLoginRequest(gmail: 'vinh@gmail.com', password: '1234');
    final response = await http.post(
      url,
      body: user.toJson(),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(children: [
        ElevatedButton(onPressed: _onPressed, child: Text('Login'))
      ]),
    );
  }
}
