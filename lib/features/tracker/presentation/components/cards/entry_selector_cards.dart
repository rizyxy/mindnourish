import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/cards/card/entry_selector_card.dart';
import 'package:mindnourish/features/tracker/presentation/views/entry_detail_page.dart';

class EntrySelector extends StatelessWidget {
  const EntrySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EntryDetailPage(
                          entry: 'Breakfast',
                        )));
          },
          child: EntrySelectorCard(
              label: "Breakfast", iconPath: "assets/breakfast_icon.png"),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EntryDetailPage(
                            entry: 'Lunch',
                          )));
            },
            child: EntrySelectorCard(
                label: "Lunch", iconPath: "assets/lunch_icon.png")),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EntryDetailPage(
                            entry: 'Dinner',
                          )));
            },
            child: EntrySelectorCard(
                label: "Dinner", iconPath: "assets/dinner_icon.png")),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EntryDetailPage(
                            entry: 'Snack',
                          )));
            },
            child: EntrySelectorCard(
                label: "Snack", iconPath: "assets/snack_icon.png"))
      ],
    );
  }
}
