import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/water_indicator.dart';

class WaterTracker extends StatelessWidget {
  const WaterTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFF93E4C1), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Water",
                textAlign: TextAlign.start,
              ),
              Text(
                "0 L",
                textAlign: TextAlign.end,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              WaterIndicator(),
              WaterIndicator(),
              WaterIndicator(),
              WaterIndicator(),
              WaterIndicator(),
              WaterIndicator(),
              WaterIndicator()
            ],
          )
        ],
      ),
    );
  }
}
