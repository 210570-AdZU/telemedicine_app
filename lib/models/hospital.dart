// lib/models/house.dart
class Hospital {
  int? id;
  String name;

  Hospital({
    this.id,
    required this.name
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      id: map['id'],
      name: map['name'],
    );
  }
}
