class User {
  final String name;
  final String age;
  final String gmail;
  final String address;
  final String id;

  User({
    required this.name,
    required this.age,
    required this.gmail,
    required this.address,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      gmail: json['gmail'],
      address: json['address'],
      id: json['_id'],
    );
  }
}

class ModelLoginRequest {
  String gmail;
  String password;

  ModelLoginRequest({required this.gmail, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'gmail': gmail,
      'password': password,
    };
  }
}

class ModelLoginResponse {
  ModelLoginResponse({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory ModelLoginResponse.fromJson(Map<String, dynamic> json) {
    return ModelLoginResponse(
      user: User.fromJson(json['user']),
      token: json['token']
    );
  }
}
