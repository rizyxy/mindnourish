import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
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
            children: <Widget>[
              Text("Our Recommendation"),
              Text("920 Kcal Breakfast")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          LinearPercentIndicator(),
          SizedBox(
            height: 20,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              Text("80g Protein"),
              Text("80g Protein"),
              Text("80g Protein"),
              Text("80g Protein"),
              Text("80g Protein"),
            ],
          )
        ],
      ),
    );
  }
}
