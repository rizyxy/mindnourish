// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mindnourish/features/tracker/domain/food.dart';

class Entry {
  String uid;
  String entry;
  Food food;
  DateTime dateTime;
  Entry({
    required this.uid,
    required this.entry,
    required this.food,
    required this.dateTime,
  });

  Entry copyWith({
    String? uid,
    String? entry,
    Food? food,
    DateTime? dateTime,
  }) {
    return Entry(
      uid: uid ?? this.uid,
      entry: entry ?? this.entry,
      food: food ?? this.food,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'entry': entry,
      'food': food.toMap(),
      'datetime': dateTime,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      uid: map['uid'] as String,
      entry: map['entry'] as String,
      food: Food.fromMap(map['food'] as Map<String, dynamic>),
      dateTime: map['datetime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) =>
      Entry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Entry(uid: $uid, entry: $entry, food: $food, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant Entry other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.entry == entry &&
        other.food == food &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ entry.hashCode ^ food.hashCode ^ dateTime.hashCode;
  }
}
