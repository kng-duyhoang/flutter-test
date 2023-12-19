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

class AuthorizeResponse {
  final User user;
  final String message;

  AuthorizeResponse({
    required this.user,
    required this.message
  });

  factory AuthorizeResponse.fromJson(Map<String, dynamic> json) {
    return AuthorizeResponse(
      user: User.fromJson(json['user']),
      message: json['message']
    );
  }
}
