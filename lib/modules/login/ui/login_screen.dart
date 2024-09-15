import 'package:blank_flutter_project/core/widgets/custom_appbar.dart';
import 'package:blank_flutter_project/modules/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
        showBackButton: false,
      ),
      body: LoginForm(),
    );
  }
}
