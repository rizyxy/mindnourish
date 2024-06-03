import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/calories_tracker_section.dart';

class EntryDetailHeader extends StatelessWidget {
  const EntryDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.arrow_back,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Breakfast",
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          InactiveSearchBar()
        ]),
      )),
    );
  }
}
