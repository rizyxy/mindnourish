import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindnourish/features/tracker/domain/water.dart';

class WaterTrackerController extends ChangeNotifier {
  double? _litre;
  double? get litre => _litre;

  String? _waterId;
  String? get waterId => _waterId;

  void clear() {
    _litre = null;
    _waterId = null;
    notifyListeners();
  }

  Future<void> setWater(double litre) async {
    if (_litre == null || _waterId == null) {
      FirebaseFirestore.instance
          .collection('waters')
          .add(Water(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  litre: litre,
                  dateTime: DateTime.now())
              .toMap())
          .then((value) {
        _waterId = value.id;
        notifyListeners();
      });
    } else {
      FirebaseFirestore.instance
          .collection('waters')
          .doc(waterId)
          .update({'litre': litre});
    }

    fetchWaterLitre();
    notifyListeners();
  }

  Future<void> fetchWaterLitre() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DateTime now = DateTime.now();
    DateTime startRange = DateTime(now.year, now.month, now.day, 0, 0, 0);
    DateTime endRange = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    try {
      _litre = await FirebaseFirestore.instance
          .collection('waters')
          .where('uid', isEqualTo: uid)
          .where('datetime', isGreaterThanOrEqualTo: startRange)
          .where('datetime', isLessThan: endRange)
          .get()
          .then((value) {
        _waterId = value.docs.first.id;
        notifyListeners();

        return value.docs.first.data()['litre'];
      });
    } catch (e) {
      _litre = 0;
    }

    notifyListeners();
  }
}
