import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:mindnourish/features/tracker/presentation/controller/recommendation_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key, required this.entry});

  final String entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Consumer2<TrackerController, RecommendationController>(
          builder: (context, trackerController, recommendationController, _) {
        Map<String, dynamic>? recommendation;

        if (entry == "Breakfast") {
          recommendation = recommendationController.breakfastRecommendation;
        } else if (entry == "Lunch") {
          recommendation = recommendationController.lunchRecommendation;
        } else if (entry == "Dinner") {
          recommendation = recommendationController.dinnerRecommendation;
        } else if (entry == "Snack") {
          recommendation = recommendationController.snackRecommendation;
        }

        if (recommendation != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Our Recommendation"),
                  Text("${recommendation['calories']} Kcal $entry")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LinearPercentIndicator(
                percent: (trackerController.getCalories(entry) ?? 0) /
                            recommendation['calories'] >
                        1
                    ? 1
                    : (trackerController.getCalories(entry) ?? 0) /
                        recommendation['calories'],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MacroProgressBar(
                        macroName: "Carbs",
                        current: trackerController.getCarbs(entry) ?? 0,
                        macroGoal: recommendation['carbs'].toDouble()),
                  ),
                  Expanded(
                    child: MacroProgressBar(
                        macroName: "Protein",
                        current: trackerController.getProtein(entry) ?? 0,
                        macroGoal: recommendation['protein'].toDouble()),
                  ),
                  Expanded(
                    child: MacroProgressBar(
                        macroName: "Fat",
                        current: trackerController.getFat(entry) ?? 0,
                        macroGoal: recommendation['fat'].toDouble()),
                  ),
                ],
              )
            ],
          );
        }

        return CircularProgressIndicator();
      }),
    );
  }
}
