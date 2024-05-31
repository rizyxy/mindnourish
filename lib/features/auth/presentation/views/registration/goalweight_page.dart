import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/button/main_button.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/number_field.dart';
import 'package:mindnourish/features/auth/presentation/components/progress_bar.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:provider/provider.dart';

class GoalWeight extends StatelessWidget {
  GoalWeight({super.key});

  final TextEditingController _goalWeightController = TextEditingController();

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
                ProgressBar(progress: 5),
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
                  "What's your goal weight?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Form(
                child: Column(
              children: <Widget>[
                NumberField(
                    label: "Goal Weight",
                    suffix: "KG",
                    controller: _goalWeightController)
              ],
            )),
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
                      if (_goalWeightController.text != "" ||
                          _goalWeightController.text != null) {
                        controller.setGoalWeight(
                            double.parse(_goalWeightController.text));

                        controller.test();
                      }
                    },
                    child: MainButton(
                      actionText: "Ok. Let's get started",
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
