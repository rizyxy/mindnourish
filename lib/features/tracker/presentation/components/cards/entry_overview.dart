import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EntryOverviewCard extends StatelessWidget {
  const EntryOverviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text("Daily Intake"), Text("0 / 2380 kcal")],
          ),
          SizedBox(
            height: 10,
          ),
          LinearPercentIndicator(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: MacroProgressBar(macroName: "Carbs", macroGoal: 298)),
              Expanded(
                  child:
                      MacroProgressBar(macroName: "Protein", macroGoal: 298)),
              Expanded(
                  child: MacroProgressBar(macroName: "Fat", macroGoal: 298)),
            ],
          )
        ],
      ),
    );
  }
}
