import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
      child: Row(
        children: <Widget>[
          Expanded(
            child: MacroProgressBar(macroName: "Carbs", macroGoal: 298),
          ),
          Expanded(
            child: MacroProgressBar(macroName: "Protein", macroGoal: 298),
          ),
          Expanded(
            child: MacroProgressBar(macroName: "Fat", macroGoal: 298),
          ),
        ],
      ),
    );
  }
}
