class UserAccountModel {
  String? uid;
  String? email;
  String? name;

  UserAccountModel({ this.uid, this.email, this.name});

  // receiving data from server
  factory UserAccountModel.fromMap(map) {
    return UserAccountModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}