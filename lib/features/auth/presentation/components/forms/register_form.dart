import 'package:flutter/cupertino.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/normal_field.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/password_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController,
      required this.formKey});

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NormalField(
              label: "Name",
              controller: nameController,
            ),
            SizedBox(
              height: 15,
            ),
            NormalField(
              label: "Email",
              controller: emailController,
            ),
            SizedBox(
              height: 15,
            ),
            NormalField(
              label: "Phone Number",
              controller: phoneController,
            ),
            SizedBox(
              height: 15,
            ),
            PasswordField(
              label: "Password",
              controller: passwordController,
            )
          ],
        ));
  }
}
