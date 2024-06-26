import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/card/food_card.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/food_cards.dart';
import 'package:mindnourish/features/tracker/presentation/components/search_header.dart';
import 'package:mindnourish/utils/const/color_const.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.entry});

  final String entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SearchHeader(
            entry: entry,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: FoodCards(
              entry: entry,
            ),
          )
        ],
      ),
    );
  }
}
