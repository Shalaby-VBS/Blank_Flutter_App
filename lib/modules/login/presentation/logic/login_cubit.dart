import 'package:blank_flutter_project/core/helpers/token_manager.dart';
import 'package:blank_flutter_project/core/states/base_state.dart';
import 'package:blank_flutter_project/modules/login/presentation/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blank_flutter_project/modules/login/data/repos/login_repo.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_request.dart';
import 'package:blank_flutter_project/core/networking/dio_factory.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState(status: Status.initial));

  // Variables
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  attemptLogin() async {
    if (!formKey.currentState!.validate()) {
      emit(const LoginState(
        status: Status.failure,
        message: 'Please fill all fields correctly',
      ));
      return;
    }

    emit(const LoginState(status: Status.loading));

    final loginResponse = await _loginRepo.login(
      loginRequest: LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    loginResponse.when(
      success: _handleSuccessResponse,
      failure: _handleFailureResponse,
    );
  }

  _handleSuccessResponse(data) async {
    await storeUserToken(data.token);
    emit(LoginState(
      status: Status.success,
      data: data,
    ));
  }

  _handleFailureResponse(error) => emit(LoginState(
        status: Status.failure,
        message: error.message.toString(),
      ));

  Future<void> storeUserToken(String token) async {
    await TokenManager.saveToken(token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
