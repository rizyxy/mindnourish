import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/calories_tracker_section.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/entry_overview.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/recommendation_cards.dart';
import 'package:mindnourish/features/tracker/presentation/components/entry_detail_header.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/macro_progressbar.dart';
import 'package:mindnourish/utils/const/color_const.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EntryDetailPage extends StatelessWidget {
  const EntryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          EntryDetailHeader(),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EntryOverviewCard(),
                SizedBox(
                  height: 20,
                ),
                RecommendationCard(),
                SizedBox(
                  height: 20,
                ),
                NourishmentCard()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NourishmentCard extends StatelessWidget {
  const NourishmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Nourishment List You Took"),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Rice Chicken Soup"),
                      Text("320 Kcal")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
