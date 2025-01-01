import 'package:blank_flutter_project/core/widgets/custom_app_bar.dart';
import 'package:blank_flutter_project/modules/login/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
      ),
      body: const LoginForm(),
    );
  }
}
