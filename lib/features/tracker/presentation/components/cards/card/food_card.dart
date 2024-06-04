import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/domain/food.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${food.name} (${food.calories} Kcal)"),
          Icon(Icons.add_circle_outline)
        ],
      ),
    );
  }
}
