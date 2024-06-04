import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/card/food_card.dart';
import 'package:mindnourish/features/tracker/presentation/controller/search_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:provider/provider.dart';

class FoodCards extends StatefulWidget {
  const FoodCards({super.key, required this.entry});

  final String entry;

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
      child: Consumer2<FoodSearchController, TrackerController>(
          builder: (context, searchController, trackerController, _) {
        if (searchController.foods == null) {
          return Text(
            "No Food",
            textAlign: TextAlign.center,
          );
        }

        return Column(
            children: searchController.foods!
                .where((element) =>
                    element.name.contains(searchController.searchQuery ?? ""))
                .toList()
                .map((e) => InkWell(
                      onTap: () async {
                        await trackerController.addEntry(widget.entry, e);

                        Navigator.pop(context);
                      },
                      child: FoodCard(
                        food: e,
                      ),
                    ))
                .toList());
      }),
    );
  }
}
