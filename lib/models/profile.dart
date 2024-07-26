class Profile {
  int? id;
  String fName;
  String mName;
  String lName;
  String extensionName;
  String email;
  String password;
  String hospital;
  String specialization;

  Profile({
    this.id,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.extensionName,
    required this.email,
    required this.password,
    required this.hospital,
    required this.specialization,
  });

  // Convert a Profile into a Map. The keys must correspond to the column names in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fName': fName,
      'mName': mName,
      'lName': lName,
      'extensionName': extensionName,
      'email': email,
      'password': password,
      'hospital': hospital,
      'specialization': specialization,
    };
  }

  // Extract a Profile object from a Map
  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        fName = map['fName'],
        mName = map['mName'],
        lName = map['lName'],
        extensionName = map['extensionName'],
        email = map['email'],
        password = map['password'],
        hospital = map['hospital'],
        specialization = map['specialization'];
}