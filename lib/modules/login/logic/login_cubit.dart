import 'package:blank_flutter_project/core/constants/shared_pref_keys.dart';
import 'package:blank_flutter_project/core/helpers/shared_pref_helper.dart';
import 'package:blank_flutter_project/modules/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blank_flutter_project/modules/login/api/repos/login_repo.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_request_body.dart';
import 'package:blank_flutter_project/core/networking/dio_factory.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void attemptLogin() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final response = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      response.when(
        success: (loginResponse) async {
          await storeUserToken(loginResponse.token);
          emit(LoginSuccess(data: loginResponse));
        },
        failure: (apiErrorModel) {
          emit(LoginError(error: apiErrorModel));
        },
      );
    } else {
      emit(LoginError(error: "Please fill all fields!"));
    }
  }

  Future<void> storeUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChangedState(isPasswordVisible));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
