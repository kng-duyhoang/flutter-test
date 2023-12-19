import 'package:healthy_app/apis/base_api.dart';
import 'package:healthy_app/model/login.dart';
import 'package:http/http.dart' as http;

class CheckTokenResponsi {
  Future<http.Response> onCheck(String token) async {
    final url = Uri.parse( '${ApiUrl.baseUrl}/user/checkToken');
    return await http.get(
      url,
      headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    );
  }
}

class LoginResponsi {
  Future<http.Response> onLogin(String gmail, String password) async {
    
    final url = Uri.parse('${ApiUrl.baseUrl}/user/login');
    final user = ModelLoginRequest(gmail: gmail, password: password);
    return await http.post(
      url,
      body: user.toJson(),
    );
  }
}
