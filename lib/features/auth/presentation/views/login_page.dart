import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/button/main_button.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/login_form.dart';
import 'package:mindnourish/features/tracker/presentation/controller/recommendation_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/water_tracker_controller.dart';
import 'package:mindnourish/features/tracker/presentation/views/home_page.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
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
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                LoginForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController)
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
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) async {
                        await Provider.of<RecommendationController>(context,
                                listen: false)
                            .fetchRecommendation();

                        await Provider.of<WaterTrackerController>(context,
                                listen: false)
                            .fetchWaterLitre();

                        await Provider.of<TrackerController>(context,
                                listen: false)
                            .fetchFood();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      });
                    }
                  },
                  child: MainButton(
                    actionText: "Login",
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
