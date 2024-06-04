import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/presentation/views/splash_page.dart';
import 'package:mindnourish/features/tracker/presentation/components/calories_tracker_section.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/entry_selector_cards.dart';
import 'package:mindnourish/features/tracker/presentation/components/macro_tracker_section.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/entry_date_selector.dart';
import 'package:mindnourish/features/tracker/presentation/components/water_tracker.dart';
import 'package:mindnourish/features/tracker/presentation/controller/recommendation_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/search_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:mindnourish/features/tracker/presentation/controller/water_tracker_controller.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                      EntrySelector(),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Provider.of<RecommendationController>(context,
                                    listen: false)
                                .clear();

                            Provider.of<FoodSearchController>(context,
                                    listen: false)
                                .clear();

                            Provider.of<TrackerController>(context,
                                    listen: false)
                                .clear();

                            Provider.of<WaterTrackerController>(context,
                                    listen: false)
                                .clear();

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashPage()),
                                (route) => false);
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
