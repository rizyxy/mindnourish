import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/controller/tracker_controller.dart';
import 'package:provider/provider.dart';

class NourishmentCard extends StatelessWidget {
  const NourishmentCard({super.key, required this.entry});

  final String entry;

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
              child: Consumer<TrackerController>(
                  builder: (context, controller, _) {
                if (entry == "Breakfast") {
                  if (controller.breakfast != null) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: controller.breakfast!
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(e.name),
                                      Text("${e.calories} Kcal")
                                    ],
                                  ),
                                ))
                            .toList());
                  } else {
                    return Text(
                      "You haven't eaten anything",
                      textAlign: TextAlign.center,
                    );
                  }
                } else if (entry == "Lunch") {
                  if (controller.lunch != null) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: controller.lunch!
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(e.name),
                                      Text("${e.calories} Kcal")
                                    ],
                                  ),
                                ))
                            .toList());
                  } else {
                    return Text(
                      "You haven't eaten anything",
                      textAlign: TextAlign.center,
                    );
                  }
                } else if (entry == "Dinner") {
                  if (controller.dinner != null) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: controller.dinner!
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(e.name),
                                      Text("${e.calories} Kcal")
                                    ],
                                  ),
                                ))
                            .toList());
                  } else {
                    return Text(
                      "You haven't eaten anything",
                      textAlign: TextAlign.center,
                    );
                  }
                } else if (entry == "Snack") {
                  if (controller.snack != null) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: controller.snack!
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(e.name),
                                      Text("${e.calories} Kcal")
                                    ],
                                  ),
                                ))
                            .toList());
                  } else {
                    return Text(
                      "You haven't eaten anything",
                      textAlign: TextAlign.center,
                    );
                  }
                }
                return Text("Oops, Something went wrong");
              }),
            )
          ],
        ),
      ),
    );
  }
}
