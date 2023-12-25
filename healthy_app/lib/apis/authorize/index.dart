import 'dart:convert';

import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/model/user/index.dart';

class AuthorizeApi {
  Future<LoginResponse> login(data) async {
    final response = await CoreApi.instance.post('/user/login', data: data);
    try {
      final User user = User.fromJson(response.data["user"]);
      return LoginResponse(
        token: response.data["token"],
        user: user
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }
}
// class CheckTokenResponsi {
//   Future<http.Response> onCheck(String token) async {
//     final url = Uri.parse( '${ApiUrl.baseUrl}/user/checkToken');
//     return await http.get(
//       url,
//       headers: {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     },
//     );
//   }
// }

// class LoginResponsi {
//   Future<http.Response> onLogin(String gmail, String password) async {
    
//     final url = Uri.parse('${ApiUrl.baseUrl}/user/login');
//     final user = ModelLoginRequest(gmail: gmail, password: password);
//     return await http.post(
//       url,
//       body: user.toJson(),
//     );
//   }
// }
