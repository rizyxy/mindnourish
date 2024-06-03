import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/presentation/components/food_searchbar.dart';
import 'package:mindnourish/features/tracker/presentation/controller/search_controller.dart';
import 'package:provider/provider.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
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
              Material(
                child: InkWell(
                  onTap: () {
                    print(Provider.of<FoodSearchController>(context,
                            listen: false)
                        .foods);
                    print("Hello");
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
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
          Material(
            child: Ink(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(15)),
              child: FoodSearchbar(),
            ),
          )
        ]),
      )),
    );
  }
}
