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

  Future<CheckResponse> check() async {
    final response = await CoreApi.instance.get('/user/checkToken');
    try {
      final User user = User.fromJson(response.data["user"]);
      return CheckResponse(
        user: user
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }
}
