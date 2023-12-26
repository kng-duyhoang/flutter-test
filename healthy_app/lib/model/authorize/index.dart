import 'package:healthy_app/model/user/index.dart';

class UserInforModel {
  String userName;
  String birthday;
  String gender;
  String weight;
  String height;

  UserInforModel({
    required this.userName,
    required this.gender,
    required this.weight,
    required this.height,
    required this.birthday
  });

  set changeUserName(String newName) {
    userName = newName;
  }

  set changeGender(String newGender) {
    userName = newGender;
  }

  set changeWeight(String newweight) {
    weight = newweight;
  }

  set changeHeight(String newheight) {
    height = newheight;
  }

  set changeBirthday(String newBirthday) {
    birthday = newBirthday;
  }
}

class LoginResponse {
  String token;
  User user;
  
  LoginResponse({
    required this.token,
    required this.user,
  });
}

class LoginRequest {
  String gmail;
  String password;
  LoginRequest({required this.gmail, required this.password});

  Map<String, dynamic> toJson() => {
    "gmail": gmail,
    "password": password,
  };

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(gmail: json['gmail'], password: json['password']);
  }
}

class CheckResponse {
  User user;
  
  CheckResponse({
    required this.user,
  });
}
