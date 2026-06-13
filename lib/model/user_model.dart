class UserModel {
  String? uid;
  String? name;
  String? email;
  DateTime? createdAt;

  UserModel({this.name, this.email, this.uid, this.createdAt});

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      uid: uid,
      createdAt: map['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uid': uid, 'createdAt': createdAt};
  }
}
