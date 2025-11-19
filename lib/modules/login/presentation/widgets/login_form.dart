import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blank_flutter_project/core/extensions/animations.dart';
import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/helpers/validations.dart';
import 'package:blank_flutter_project/core/states/base_state.dart';
import 'package:blank_flutter_project/core/widgets/custom_button.dart';
import 'package:blank_flutter_project/core/widgets/custom_text_form_field.dart';
import 'package:blank_flutter_project/modules/login/presentation/logic/login_cubit.dart';
import 'package:blank_flutter_project/modules/login/presentation/logic/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            // Navigate to home or show success
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('login_success'.tr())),
            );
          }
          if (state.isFailure) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'login_error'.tr()),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();
          return Form(
            key: loginCubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: loginCubit.emailController,
                  labelText: 'email'.tr(),
                  prefixIcon: Icons.email_rounded,
                  validator: (value) => Validations.validateEmail(value),
                  textInputAction: TextInputAction.next,
                ).formFieldAnimation(index: 0),
                16.verticalSpace,
                CustomTextFormField(
                  controller: loginCubit.passwordController,
                  labelText: 'password'.tr(),
                  prefixIcon: Icons.lock_rounded,
                  suffixIcon: state.isPasswordVisible
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  obscureText: !state.isPasswordVisible,
                  onSuffixIconTap: () => loginCubit.togglePasswordVisibility(),
                  validator: (value) => Validations.validatePassword(value),
                  textInputAction: TextInputAction.done,
                ).formFieldAnimation(index: 1),
                32.verticalSpace,
                CustomButton(
                  title: 'login'.tr(),
                  onPressed: () => loginCubit.attemptLogin(),
                  isLoading: state.status == Status.loading,
                ).formFieldAnimation(index: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}
