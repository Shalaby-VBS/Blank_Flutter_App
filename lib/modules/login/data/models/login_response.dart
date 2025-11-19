import '../../../../core/models/user_model.dart';

class LoginResponse {
  final String token;
  final UserModel? user;

  LoginResponse({required this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
