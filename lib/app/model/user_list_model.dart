// To parse this JSON data, do
//
//     final usersContactModel = usersContactModelFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

UsersContactModel usersContactModelFromJson(String str) => UsersContactModel.fromJson(json.decode(str));

String usersContactModelToJson(UsersContactModel data) => json.encode(data.toJson());

class UsersContactModel {
  List<UserContact>? userContacts;

  UsersContactModel({
    this.userContacts,
  });

  factory UsersContactModel.fromJson(Map<String, dynamic> json) => UsersContactModel(
    userContacts: json["userContacts"] == null ? [] : List<UserContact>.from(json["userContacts"]!.map((x) => UserContact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userContacts": userContacts == null ? [] : List<dynamic>.from(userContacts!.map((x) => x.toJson())),
  };
}

class UserContact {
  String? status;
  String? phoneNo;
  String? lastMessage;
  Uint8List? profilePic;
  DateTime? dateTime;
  String? name;

  UserContact({
    this.status,
    this.phoneNo,
    this.lastMessage,
    this.profilePic,
    this.dateTime,
    this.name,
  });

  factory UserContact.fromJson(Map<String, dynamic> json) => UserContact(
    status: json["status"],
    phoneNo: json["phoneNo"],
    lastMessage: json["lastMessage"],
    profilePic: json["profilePic"],
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "phoneNo": phoneNo,
    "lastMessage": lastMessage,
    "profilePic": profilePic,
    "dateTime": dateTime?.toIso8601String(),
    "name": name,
  };
}
