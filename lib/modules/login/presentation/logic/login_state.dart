import 'package:blank_flutter_project/core/states/base_state.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_response.dart';
import 'package:flutter/foundation.dart';

/// Login State that extends BaseState with additional UI fields
@immutable
class LoginState extends BaseState<LoginResponse> {
  final bool isPasswordVisible;

  const LoginState({
    super.status,
    super.data,
    super.message,
    this.isPasswordVisible = false,
  });

  @override
  LoginState copyWith({
    Status? status,
    LoginResponse? data,
    String? message,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
