import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:mindnourish/features/tracker/presentation/controller/recommendation_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class EntryOverviewCard extends StatelessWidget {
  const EntryOverviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<RecommendationController, TrackerController>(
      builder: (context, recommendationController, trackerController, _) =>
          Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Daily Intake"),
                Text(
                    "${trackerController.getTotalCalories()} / ${recommendationController.caloriesRecommendation} kcal")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              percent: trackerController.getTotalCalories()! /
                  recommendationController.caloriesRecommendation!,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: MacroProgressBar(
                        macroName: "Carbs",
                        current: trackerController.getTotalCarbs() ?? 0,
                        macroGoal:
                            recommendationController.carbsRecommendation ?? 0)),
                Expanded(
                    child: MacroProgressBar(
                        macroName: "Protein",
                        current: trackerController.getTotalProtein() ?? 0,
                        macroGoal:
                            recommendationController.proteinRecommendation ??
                                0)),
                Expanded(
                    child: MacroProgressBar(
                        macroName: "Fat",
                        current: trackerController.getTotalFat() ?? 0,
                        macroGoal:
                            recommendationController.fatRecommendation ?? 0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
