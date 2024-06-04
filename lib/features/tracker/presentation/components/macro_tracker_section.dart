import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:mindnourish/features/tracker/presentation/controller/recommendation_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class MacroTrackerSection extends StatelessWidget {
  const MacroTrackerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xFF93E4C1), borderRadius: BorderRadius.circular(15)),
      child: Consumer2<RecommendationController, TrackerController>(
          builder: (context, recommendationController, trackerController, _) {
        if (recommendationController.recommendationExists()) {
          return Row(
            children: <Widget>[
              Expanded(
                child: MacroProgressBar(
                    macroName: "Carbs",
                    current: trackerController.getTotalCarbs() ?? 0,
                    macroGoal: recommendationController.carbsRecommendation!),
              ),
              Expanded(
                child: MacroProgressBar(
                    macroName: "Protein",
                    current: trackerController.getTotalProtein() ?? 0,
                    macroGoal: recommendationController.proteinRecommendation!),
              ),
              Expanded(
                child: MacroProgressBar(
                    current: trackerController.getTotalFat() ?? 0,
                    macroName: "Fat",
                    macroGoal: recommendationController.fatRecommendation!),
              ),
            ],
          );
        }

        return CircularProgressIndicator();
      }),
    );
  }
}
