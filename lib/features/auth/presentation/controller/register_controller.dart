import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:mindnourish/features/auth/domain/user.dart';

class RegisterController extends ChangeNotifier {
  String? _name;
  String? get name => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  String? _email;
  String? get email => _email;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String? _phone;
  String? get phone => _phone;

  void setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String? _disease;
  String? get disease => _disease;

  void setDisease(String disease) {
    _disease = disease;
    notifyListeners();
  }

  String? _gender;
  String? get gender => _gender;

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;

  void setBirthdate(DateTime birthdate) {
    _birthdate = birthdate;
    notifyListeners();
  }

  double? _weight;
  double? get weight => _weight;

  void setWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  double? _height;
  double? get height => _height;

  void setHeight(double height) {
    _height = height;
    notifyListeners();
  }

  double? _goalWeight;
  double? get goalWeight => _goalWeight;

  void setGoalWeight(goalWeight) {
    _goalWeight = goalWeight;
    notifyListeners();
  }

  List<String> _diseases = ["Anoreksia Nervosa", "Bulimia Nervosa"];
  List<String> get diseases => _diseases;

  List<String> _genders = ["Male", "Female"];
  List<String> get genders => _genders;

  void clear() {
    _name = null;
    _email = null;
    _phone = null;
    _password = null;
    _birthdate = null;
    _disease = null;
    _gender = null;
    _height = null;
    _weight = null;
    _goalWeight = null;
    notifyListeners();
  }

  Future<void> register() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) async {
      User user = User(
          uid: value.user!.uid,
          name: name!,
          email: email!,
          phone: phone!,
          disease: disease!,
          gender: gender!,
          birthdate: birthdate!,
          height: height!,
          weight: weight!,
          goalWeight: goalWeight!);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(user.toMap());

      clear();
    });
  }
}
