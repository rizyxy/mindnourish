// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String uid;
  String name;
  String email;
  String phone;
  String disease;
  String gender;
  DateTime birthdate;
  double height;
  double weight;
  double goalWeight;
  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.disease,
    required this.gender,
    required this.birthdate,
    required this.height,
    required this.weight,
    required this.goalWeight,
  });

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? disease,
    String? gender,
    DateTime? birthdate,
    double? height,
    double? weight,
    double? goalWeight,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      disease: disease ?? this.disease,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      goalWeight: goalWeight ?? this.goalWeight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'disease': disease,
      'gender': gender,
      'birthdate': birthdate,
      'height': height,
      'weight': weight,
      'goalWeight': goalWeight,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      disease: map['disease'] as String,
      gender: map['gender'] as String,
      birthdate: map['birthdate'],
      height: map['height'] as double,
      weight: map['weight'] as double,
      goalWeight: map['goalWeight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, email: $email, phone: $phone, disease: $disease, gender: $gender, birthdate: $birthdate, height: $height, weight: $weight, goalWeight: $goalWeight)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.disease == disease &&
        other.gender == gender &&
        other.birthdate == birthdate &&
        other.height == height &&
        other.weight == weight &&
        other.goalWeight == goalWeight;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        disease.hashCode ^
        gender.hashCode ^
        birthdate.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        goalWeight.hashCode;
  }
}
