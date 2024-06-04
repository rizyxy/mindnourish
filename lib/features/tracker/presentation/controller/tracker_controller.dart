import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/domain/entry.dart';
import 'package:mindnourish/features/tracker/domain/food.dart';

class TrackerController extends ChangeNotifier {
  List<Food>? _breakfast;
  List<Food>? get breakfast => _breakfast;

  List<Food>? _lunch;
  List<Food>? get lunch => _lunch;

  List<Food>? _dinner;
  List<Food>? get dinner => _dinner;

  List<Food>? _snack;
  List<Food>? get snack => _snack;

  double? getCalories(String entry) {
    double? temp;

    if (entry == "Breakfast") {
      temp = _breakfast?.fold(
          0, (previousValue, element) => previousValue! + element.calories);
    } else if (entry == "Lunch") {
      temp = _lunch?.fold(
          0, (previousValue, element) => previousValue! + element.calories);
    } else if (entry == "Dinner") {
      temp = _dinner?.fold(
          0, (previousValue, element) => previousValue! + element.calories);
    } else if (entry == "Snack") {
      temp = _snack?.fold(
          0, (previousValue, element) => previousValue! + element.calories);
    }
    return double.parse(temp!.toStringAsFixed(2));
  }

  double? getCarbs(String entry) {
    double? temp;

    if (entry == "Breakfast") {
      temp = _breakfast?.fold(
          0, (previousValue, element) => previousValue! + element.carbs);
    } else if (entry == "Lunch") {
      temp = _lunch?.fold(
          0, (previousValue, element) => previousValue! + element.carbs);
    } else if (entry == "Dinner") {
      temp = _dinner?.fold(
          0, (previousValue, element) => previousValue! + element.carbs);
    } else if (entry == "Snack") {
      temp = _snack?.fold(
          0, (previousValue, element) => previousValue! + element.carbs);
    }
    return double.parse(temp!.toStringAsFixed(2));
  }

  double? getProtein(String entry) {
    double? temp;

    if (entry == "Breakfast") {
      temp = _breakfast?.fold(
          0, (previousValue, element) => previousValue! + element.protein);
    } else if (entry == "Lunch") {
      temp = _lunch?.fold(
          0, (previousValue, element) => previousValue! + element.protein);
    } else if (entry == "Dinner") {
      temp = _dinner?.fold(
          0, (previousValue, element) => previousValue! + element.protein);
    } else if (entry == "Snack") {
      temp = _snack?.fold(
          0, (previousValue, element) => previousValue! + element.protein);
    }
    return double.parse(temp!.toStringAsFixed(2));
  }

  double? getFat(String entry) {
    double? temp;

    if (entry == "Breakfast") {
      temp = _breakfast?.fold(
          0, (previousValue, element) => previousValue! + element.fat);
    } else if (entry == "Lunch") {
      temp = _lunch?.fold(
          0, (previousValue, element) => previousValue! + element.fat);
    } else if (entry == "Dinner") {
      temp = _dinner?.fold(
          0, (previousValue, element) => previousValue! + element.fat);
    } else if (entry == "Snack") {
      temp = _snack?.fold(
          0, (previousValue, element) => previousValue! + element.fat);
    }
    return double.parse(temp!.toStringAsFixed(2));
  }

  Future<void> addEntry(String entry, Food food) async {
    await FirebaseFirestore.instance.collection(entry.toLowerCase()).add(Entry(
            uid: FirebaseAuth.instance.currentUser!.uid,
            entry: entry,
            food: food,
            dateTime: DateTime.now())
        .toMap());

    fetchFood();

    notifyListeners();
  }

  List<Food>? getCombinedEntry() {
    List<Food>? _totalFood = [];

    _totalFood.addAll(_breakfast ?? []);
    _totalFood.addAll(_lunch ?? []);
    _totalFood.addAll(_dinner ?? []);
    _totalFood.addAll(_snack ?? []);

    return _totalFood;
  }

  double? getTotalCalories() {
    List<Food>? _totalFood = getCombinedEntry();

    double? totalCalories = _totalFood?.fold(
        0, (previousValue, element) => previousValue! + element.calories);

    return double.parse(totalCalories!.toStringAsFixed(2));
  }

  double? getTotalCarbs() {
    List<Food>? _totalFood = getCombinedEntry();

    double? totalCarbs = _totalFood?.fold(
        0, (previousValue, element) => previousValue! + element.carbs);

    return double.parse(totalCarbs!.toStringAsFixed(2));
  }

  double? getTotalProtein() {
    List<Food>? _totalFood = getCombinedEntry();

    double? totalProtein = _totalFood?.fold(
        0, (previousValue, element) => previousValue! + element.protein);

    return double.parse(totalProtein!.toStringAsFixed(2));
  }

  double? getTotalFat() {
    List<Food>? _totalFood = getCombinedEntry();

    double? totalFat = _totalFood?.fold(
        0, (previousValue, element) => previousValue! + element.fat);

    return double.parse(totalFat!.toStringAsFixed(2));
  }

  Future<void> fetchFood() async {
    _breakfast = await fetchEntry('breakfast');
    _lunch = await fetchEntry('lunch');
    _dinner = await fetchEntry('dinner');
    _snack = await fetchEntry('snack');

    notifyListeners();
  }

  Future<List<Food>?> fetchEntry(String entry) async {
    DateTime now = DateTime.now();
    DateTime startRange = DateTime(now.year, now.month, now.day, 0, 0, 0);
    DateTime endRange = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    List<Food>? _entry = await FirebaseFirestore.instance
        .collection(entry)
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('datetime', isGreaterThanOrEqualTo: startRange)
        .where('datetime', isLessThan: endRange)
        .get()
        .then((value) => value.docs.map((e) {
              return Food(
                  id: e.id,
                  name: e.data()['food']['name'],
                  calories: e.data()['food']['calories'],
                  carbs: e.data()['food']['carbs'],
                  protein: e.data()['food']['protein'],
                  fat: e.data()['food']['fat']);
            }).toList());

    return _entry;
  }
}
