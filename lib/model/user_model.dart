class User {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  User({ required this.name, required this.email, required this.password, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }

  User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
    phoneNumber = map['phoneNumber'];
  }
}
