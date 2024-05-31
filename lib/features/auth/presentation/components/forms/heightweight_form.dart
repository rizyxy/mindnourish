import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/normal_field.dart';
import 'package:mindnourish/features/auth/presentation/components/forms/form_component/number_field.dart';

class HeightWeightForm extends StatelessWidget {
  const HeightWeightForm(
      {super.key,
      required this.heightController,
      required this.weightController,
      required this.formKey});

  final TextEditingController heightController;
  final TextEditingController weightController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NumberField(
              label: "Height",
              suffix: "CM",
              controller: heightController,
            ),
            SizedBox(
              height: 20,
            ),
            NumberField(
              label: "Weight",
              suffix: "KG",
              controller: weightController,
            )
          ],
        ));
  }
}
