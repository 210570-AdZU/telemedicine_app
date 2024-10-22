// lib/models/patient.dart
import 'package:intl/intl.dart';

class Patient {
  int? id;
  String firstName;
  String? middleName;
  String lastName;
  String? contactNumber;
  String? placeOfWork;
  String? address;
  String? sex;
  DateTime? birthday;
  String? civilStatus;
  String? birthplace;
  String? ethnicity;
  String? language;

  Patient({
    this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.contactNumber,
    this.placeOfWork,
    this.address,
    this.sex,
    this.birthday,
    this.civilStatus,
    this.birthplace,
    this.ethnicity,
    this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'contactNumber': contactNumber,
      'placeOfWork': placeOfWork,
      'address': address,
      'sex': sex,
      'birthday': birthday?.toIso8601String(),
      'civilStatus': civilStatus,
      'birthplace': birthplace,
      'ethnicity': ethnicity,
      'language': language,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      contactNumber: map['contactNumber'],
      placeOfWork: map['placeOfWork'],
      address: map['address'],
      sex: map['sex'],
      birthday: DateTime.parse(map['birthday']),
      civilStatus: map['civilStatus'],
      birthplace: map['birthplace'],
      ethnicity: map['ethnicity'],
      language: map['language'],
    );
  }
}