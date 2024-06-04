// ignore_for_file: public_member_api_docs, sort_constructors_first
class Water {
  String uid;
  double litre;
  DateTime dateTime;

  Water({
    required this.uid,
    required this.litre,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'litre': litre, 'datetime': dateTime};
  }
}
