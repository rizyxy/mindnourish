import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/components/cards/card/auth_card.dart';
import 'package:mindnourish/features/auth/presentation/controller/register_controller.dart';
import 'package:provider/provider.dart';

class DiseaseCards extends StatelessWidget {
  const DiseaseCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
        builder: (context, controller, _) => ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
                  onTap: () =>
                      controller.setDisease(controller.diseases[index]),
                  child: AuthCard(
                    text: controller.diseases[index],
                    selected: controller.disease ?? "",
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: controller.diseases.length));
  }
}
