import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/calories_tracker_section.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/entry_selector_cards.dart';
import 'package:mindnourish/features/tracker/presentation/components/macro_tracker_section.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/entry_date_selector.dart';
import 'package:mindnourish/features/tracker/presentation/components/water_tracker.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainGreen,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CalorieTrackerSection(),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EntryDateSelector(),
                    SizedBox(
                      height: 20,
                    ),
                    MacroTrackerSection(),
                    SizedBox(
                      height: 20,
                    ),
                    WaterTracker(),
                    SizedBox(
                      height: 20,
                    ),
                    EntrySelector()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
