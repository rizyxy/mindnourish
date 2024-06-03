// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Food {
  String id;
  String name;
  double calories;
  double carbs;
  double protein;
  double fat;
  Food({
    required this.id,
    required this.name,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
  });

  Food copyWith({
    String? id,
    String? name,
    double? calories,
    double? carbs,
    double? protein,
    double? fat,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      carbs: carbs ?? this.carbs,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'calories': calories,
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as String,
      name: map['name'] as String,
      calories: map['calories'] as double,
      carbs: map['carbs'] as double,
      protein: map['protein'] as double,
      fat: map['fat'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Food(id: $id, name: $name, calories: $calories, carbs: $carbs, protein: $protein, fat: $fat)';
  }

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.calories == calories &&
        other.carbs == carbs &&
        other.protein == protein &&
        other.fat == fat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        calories.hashCode ^
        carbs.hashCode ^
        protein.hashCode ^
        fat.hashCode;
  }
}
