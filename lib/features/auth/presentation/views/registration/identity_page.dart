import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/button/main_button.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/register_form.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:mindnourish/features/auth/presentation/views/registration/disease_page.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:provider/provider.dart';

class IdentityPage extends StatelessWidget {
  IdentityPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainGreen,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterForm(
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    passwordController: _passwordController,
                    formKey: _formKey),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "We use information to calculated and provide you with daily personalized recommendation",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<RegisterController>(context, listen: false)
                          .setName(_nameController.text);

                      Provider.of<RegisterController>(context, listen: false)
                          .setEmail(_emailController.text);

                      Provider.of<RegisterController>(context, listen: false)
                          .setPhone(_phoneController.text);

                      Provider.of<RegisterController>(context, listen: false)
                          .setPassword(_passwordController.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiseasePage()));
                    }
                  },
                  child: MainButton(
                    actionText: "Register",
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
