class UserModel {
  final String token;

  UserModel({required this.token});
  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(token: json['access_token']??"");
  }
}
