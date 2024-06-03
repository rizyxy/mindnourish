import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/card/food_card.dart';
import 'package:mindnourish/features/tracker/presentation/components/search_header.dart';
import 'package:mindnourish/utils/const/color_const.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SearchHeader(),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[FoodCard()],
            ),
          )
        ],
      ),
    );
  }
}
