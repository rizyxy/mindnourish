import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/controller/search_controller.dart';
import 'package:provider/provider.dart';

class FoodSearchbar extends StatelessWidget {
  FoodSearchbar({
    super.key,
  });

  final TextEditingController _searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        Provider.of<FoodSearchController>(context, listen: false)
            .setSearchQuery(_searchbarController.text);
      },
      child: TextFormField(
        onChanged: (val) {
          Provider.of<FoodSearchController>(context, listen: false)
              .setSearchQuery(_searchbarController.text);
        },
        controller: _searchbarController,
        style: TextStyle(letterSpacing: 1, fontSize: 13),
        decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: "Food, drink, brand"),
      ),
    );
  }
}
