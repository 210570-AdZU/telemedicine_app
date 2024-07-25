class User {
  int? id;
  String fName;
  String mName;
  String lName;
  String extensionName;
  String email;
  String password;

  User({
    this.id,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.extensionName,
    required this.email,
    required this.password,
  });

  // Convert a User into a Map. The keys must correspond to the column names in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fName': fName,
      'mName': mName,
      'lName': lName,
      'extensionName': extensionName,
      'email': email,
      'password': password,
    };
  }

  // Extract a User object from a Map
  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        fName = map['fName'],
        mName = map['mName'],
        lName = map['lName'],
        extensionName = map['extensionName'],
        email = map['email'],
        password = map['password'];
}