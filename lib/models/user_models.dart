import '../utils/importer.dart';

class UserModel {
  String? uid;
  String? email;
  String? name;
  String? userName;
  String? photoUrl;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.userName,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      userName: json['userName'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['userName'] = userName;
    data['photoUrl'] = photoUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
