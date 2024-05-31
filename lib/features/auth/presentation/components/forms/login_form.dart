import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/normal_field.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NormalField(label: "Email", controller: emailController),
            SizedBox(
              height: 20,
            ),
            PasswordField(label: "Password", controller: passwordController)
          ],
        ));
  }
}
