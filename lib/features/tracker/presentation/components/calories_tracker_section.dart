import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/views/search_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CalorieTrackerSection extends StatelessWidget {
  const CalorieTrackerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF118A7E),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "FOOD EATEN",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircularPercentIndicator(
                  radius: 80,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "2850",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "KCAL LEFT",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "GLASS DRANK",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class InactiveSearchBar extends StatelessWidget {
  const InactiveSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Color(0xFFECECEC),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Color(0xFF959595),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Food, meal or brand",
                textAlign: TextAlign.left,
                style: TextStyle(color: Color(0xFF959595), letterSpacing: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
