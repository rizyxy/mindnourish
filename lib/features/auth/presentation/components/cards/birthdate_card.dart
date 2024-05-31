import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:provider/provider.dart';

class BirthdateCard extends StatelessWidget {
  const BirthdateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(builder: (context, controller, _) {
      return InkWell(
        onTap: () async {
          DateTime? birthdate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1800),
              lastDate: DateTime.now());

          if (birthdate != null) {
            controller.setBirthdate(birthdate);
          }
        },
        child: Text(
          controller.birthdate == null
              ? "Pick Date"
              : controller.birthdate!.toString().split(" ").first,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    });
  }
}
