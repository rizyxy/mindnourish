import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Onigiri Salmon (180 Kcal)"),
          Icon(Icons.add_circle_outline)
        ],
      ),
    );
  }
}
