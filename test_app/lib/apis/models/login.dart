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
