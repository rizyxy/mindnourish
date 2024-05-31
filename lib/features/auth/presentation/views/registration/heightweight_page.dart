import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/button/main_button.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/heightweight_form.dart';
import 'package:mindnourish/features/auth/presentation/components/progress_bar.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:mindnourish/features/auth/presentation/views/registration/goalweight_page.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:provider/provider.dart';

class HeightWeightPage extends StatelessWidget {
  HeightWeightPage({super.key});

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ProgressBar(progress: 4),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's get to know you better",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "What's your weight and height?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                HeightWeightForm(
                    formKey: _formKey,
                    heightController: _heightController,
                    weightController: _weightController)
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
                Consumer<RegisterController>(
                  builder: (context, controller, _) => InkWell(
                    onTap: () {
                      if (_heightController.text != "" ||
                          _weightController.text != "") {
                        controller
                            .setHeight(double.parse(_heightController.text));

                        controller
                            .setWeight(double.parse(_weightController.text));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoalWeight()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            "Height and weight cannot be empty",
                            style: TextStyle(color: Colors.red),
                          ),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Colors.black.withOpacity(0.3),
                        ));
                      }
                    },
                    child: MainButton(
                      actionText: "Next",
                    ),
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
