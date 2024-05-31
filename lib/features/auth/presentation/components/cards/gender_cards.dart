import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/cards/card/auth_card.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:provider/provider.dart';

class GenderCards extends StatelessWidget {
  const GenderCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
        builder: (context, controller, _) => ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
                  onTap: () => controller.setGender(controller.genders[index]),
                  child: AuthCard(
                      text: controller.genders[index],
                      selected: controller.gender ?? ""),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: controller.genders.length));
  }
}
