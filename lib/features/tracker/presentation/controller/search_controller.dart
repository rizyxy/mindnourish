import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/domain/food.dart';

class FoodSearchController extends ChangeNotifier {
  String? _entryType;
  String? get entryType => _entryType;

  void setEntryType(String entryType) {
    _entryType = entryType;
    notifyListeners();
  }

  List<Food>? _foods;
  List<Food>? get foods => _foods;

  void fetchFood() async {
    _foods = await FirebaseFirestore.instance.collection('foods').get().then(
        (value) => value.docs
            .map((e) => Food(
                id: e.id,
                name: e.data()['name'],
                calories: e.data()['calories'],
                carbs: e.data()['carbs'],
                protein: e.data()['protein'],
                fat: e.data()['fat']))
            .toList());

    notifyListeners();
  }

  String? _searchQuery;
  String? get searchQuery => _searchQuery;

  void setSearchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    notifyListeners();
  }

  void clear() {
    _entryType = null;
    _foods = null;
    _searchQuery = null;
    notifyListeners();
  }
}
