// lib/models/case.dart
class Case {
  int? id;
  double temperature;
  int respiratory;
  int heart;
  int blood;
  double oxygen;
  double weight;
  double height;
  String cc;
  String hpi;
  String pmh;
  String pe;
  String wi;
  String imd;
  String reason;
  int? hospitalId;
  int? patientId;

  Case({
    this.id,
    required this.temperature,
    required this.respiratory,
    required this.heart,
    required this.blood,
    required this.oxygen,
    required this.weight,
    required this.height,
    required this.cc,
    required this.hpi,
    required this.pmh,
    required this.pe,
    required this.wi,
    required this.imd,
    required this.reason,
    this.hospitalId,
    this.patientId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'temperature': temperature,
      'respiratory': respiratory,
      'heart': heart,
      'blood': blood,
      'oxygen': oxygen,
      'weight': weight,
      'height': height,
      'cc': cc,
      'hpi': hpi,
      'pmh': pmh,
      'pe': pe,
      'wi': wi,
      'imd': imd,
      'reason': reason,
      'hospitalId': hospitalId,
      'patientId': patientId,
    };
  }

  factory Case.fromMap(Map<String, dynamic> map) {
    return Case(
      id: map['id'],
      temperature: (map['temperature'] is int) ? map['temperature'].toDouble() : map['temperature'],
      respiratory: map['respiratory'],
      heart: map['heart'],
      blood: map['blood'],
      oxygen: (map['oxygen'] is int) ? map['oxygen'].toDouble() : map['oxygen'],
      weight: (map['weight'] is int) ? map['weight'].toDouble() : map['weight'],
      height: (map['height'] is int) ? map['height'].toDouble() : map['height'],
      cc: map['cc'],
      hpi: map['hpi'],
      pmh: map['pmh'],
      pe: map['pe'],
      wi: map['wi'],
      imd: map['imd'],
      reason: map['reason'],
      hospitalId: map['hospitalId'],
      patientId: map['patientId'],
    );
  }
}