import 'package:blank_flutter_project/core/helpers/spaces.dart';
import 'package:blank_flutter_project/core/helpers/validations.dart';
import 'package:blank_flutter_project/core/widgets/custom_button.dart';
import 'package:blank_flutter_project/core/widgets/custom_text_form_field.dart';
import 'package:blank_flutter_project/modules/login/logic/login_cubit.dart';
import 'package:blank_flutter_project/modules/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();
          return Form(
            key: loginCubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: loginCubit.emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email_rounded,
                  validator: (value) => Validations.validateEmail(value),
                  textInputAction: TextInputAction.next,
                ),
                Spaces.vertical(16),
                CustomTextFormField(
                  controller: loginCubit.passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock_rounded,
                  suffixIcon: loginCubit.isPasswordVisible
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  obscureText: !loginCubit.isPasswordVisible,
                  onSuffixIconTap: () => loginCubit.togglePasswordVisibility(),
                  validator: (value) => Validations.validatePassword(value),
                  textInputAction: TextInputAction.done,
                ),
                Spaces.vertical(32),
                CustomButton(
                  text: 'Login',
                  onPressed: () => loginCubit.attemptLogin(),
                  isLoading: state is LoginLoading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
