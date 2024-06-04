import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/small_component/water_indicator.dart';
import 'package:mindnourish/features/tracker/presentation/controller/water_tracker_controller.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<WaterTrackerController>(
        builder: (context, controller, _) => Column(
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
                  "${controller.litre} L",
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
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(1);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 1,
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(2);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 2,
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(3);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 3,
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(4);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 4,
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(5);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 5,
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(6);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 6,
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          controller.setWater(7);
                        },
                        child: WaterIndicator(
                          litre: controller.litre ?? 0,
                          indicator: 7,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
