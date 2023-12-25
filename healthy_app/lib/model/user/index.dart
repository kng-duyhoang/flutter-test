class User {
  String id;
  String gmail;
  String username;
  String birthday;
  String gender;
  String height;
  String weight;

  User({
    required this.id,
    required this.username,
    required this.gmail,
    required this.gender,
    required this.height,
    required this.weight,
    required this.birthday,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? "",
      username: json["username"] ?? "",
      gmail: json['gmail'] ?? "",
      gender: json['gender']  ?? "",
      height: json['height']  ?? "",
      weight: json['weight']  ?? "",
      birthday: json['birthday']  ?? "",
    );
  }
}
