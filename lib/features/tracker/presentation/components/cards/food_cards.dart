import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/card/food_card.dart';
import 'package:mindnourish/features/tracker/presentation/controller/search_controller.dart';
import 'package:provider/provider.dart';

class FoodCards extends StatefulWidget {
  const FoodCards({
    super.key,
  });

  @override
  State<FoodCards> createState() => _FoodCardsState();
}

class _FoodCardsState extends State<FoodCards> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodSearchController>(context, listen: false).fetchFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<FoodSearchController>(builder: (context, controller, _) {
        if (controller.foods == null) {
          return Text(
            "No Food",
            textAlign: TextAlign.center,
          );
        }

        return Column(
            children: controller.foods!
                .where((element) =>
                    element.name.contains(controller.searchQuery ?? ""))
                .toList()
                .map((e) => FoodCard())
                .toList());
      }),
    );
  }
}
