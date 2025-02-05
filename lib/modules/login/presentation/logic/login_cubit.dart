import 'package:blank_flutter_project/core/constants/shared_pref_keys.dart';
import 'package:blank_flutter_project/core/helpers/shared_pref_helper.dart';
import 'package:blank_flutter_project/modules/login/presentation/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blank_flutter_project/modules/login/data/repos/login_repo.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_request.dart';
import 'package:blank_flutter_project/core/networking/dio_factory.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> attemptLogin() async {
    if (!formKey.currentState!.validate()) {
      emit(LoginError('Please fill all fields correctly'));
      return;
    }

    emit(LoginLoading());

    final response = await _loginRepo.login(
      LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    response.when(
      success: (data) async {
        await storeUserToken(data.token);
        emit(LoginSuccess(data));
      },
      failure: (error) => emit(LoginError(error.message.toString())),
    );
  }

  Future<void> storeUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
