import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/calories_tracker_section.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/entry_overview.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/nourishment_card.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/recommendation_cards.dart';
import 'package:mindnourish/features/tracker/presentation/components/entry_detail_header.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class EntryDetailPage extends StatelessWidget {
  const EntryDetailPage({super.key, required this.entry});

  final String entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          EntryDetailHeader(
            entry: entry,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer<TrackerController>(
                    builder: (context, controller, _) => InkWell(
                        onTap: () {
                          controller.fetchFood();
                          print(controller.breakfast);
                        },
                        child: EntryOverviewCard())),
                SizedBox(
                  height: 20,
                ),
                RecommendationCard(
                  entry: entry,
                ),
                SizedBox(
                  height: 20,
                ),
                NourishmentCard(
                  entry: entry,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
