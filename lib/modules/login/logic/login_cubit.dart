import 'package:blank_flutter_project/core/constants/shared_pref_keys.dart';
import 'package:blank_flutter_project/core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blank_flutter_project/core/logic/base_state.dart';
import 'package:blank_flutter_project/modules/login/api/repos/login_repo.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_request_body.dart';
import 'package:blank_flutter_project/core/networking/dio_factory.dart';

class LoginCubit extends Cubit<BaseState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(InitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(LoadingState());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token);
        emit(SuccessState(data: loginResponse));
      },
      failure: (apiErrorModel) {
        emit(ErrorState(error: apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
