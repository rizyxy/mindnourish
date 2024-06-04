import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecommendationController extends ChangeNotifier {
  double? _caloriesRecommendation;
  double? get caloriesRecommendation => _caloriesRecommendation;

  double? _carbsRecommendation;
  double? get carbsRecommendation => _carbsRecommendation;

  double? _proteinRecommendation;
  double? get proteinRecommendation => _proteinRecommendation;

  double? _fatRecommendation;
  double? get fatRecommendation => _fatRecommendation;

  Map<String, dynamic>? _breakfastRecommendation;
  Map<String, dynamic>? get breakfastRecommendation => _breakfastRecommendation;

  Map<String, dynamic>? _lunchRecommendation;
  Map<String, dynamic>? get lunchRecommendation => _lunchRecommendation;

  Map<String, dynamic>? _dinnerRecommendation;
  Map<String, dynamic>? get dinnerRecommendation => _dinnerRecommendation;

  Map<String, dynamic>? _snackRecommendation;
  Map<String, dynamic>? get snackRecommendation => _snackRecommendation;

  bool recommendationExists() {
    if (_caloriesRecommendation != null) {
      if (_carbsRecommendation != null) {
        if (_proteinRecommendation != null) {
          if (_fatRecommendation != null) {
            return true;
          }
        }
      }
    }

    return false;
  }

  Future<void> fetchRecommendation() async {
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    String disease = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()!['disease']);

    FirebaseFirestore.instance
        .collection('recommendation')
        .where('disease', isEqualTo: disease)
        .get()
        .then((value) {
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot = value.docs.first;

      _caloriesRecommendation = snapshot.data()['calories'].toDouble();
      _carbsRecommendation = snapshot.data()['carbs'].toDouble();
      _proteinRecommendation = snapshot.data()['protein'].toDouble();
      _fatRecommendation = snapshot.data()['fat'].toDouble();

      _breakfastRecommendation = snapshot.data()['breakfast'];
      _lunchRecommendation = snapshot.data()['lunch'];
      _dinnerRecommendation = snapshot.data()['dinner'];
      _snackRecommendation = snapshot.data()['snacks'];

      notifyListeners();
    });
  }
}
