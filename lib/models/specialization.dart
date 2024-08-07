// lib/models/specialization.dart
class Specialization{
  int? id;
  String name;
  String description;
  
  Specialization({
    this.id,
    required this.name,
    required this.description,
  });
  
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Specialization.fromMap(Map<String, dynamic> map){
    return Specialization(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}