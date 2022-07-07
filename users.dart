import 'package:flutter/material.dart';
import 'dart:convert';

/*class User {
  final int userId;
  final String username;
  final String name;

  User({required this.userId, required this.username, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      username: json['usename'],
      name: json['name'],
    );
  }
}*/
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);



List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.name,
    required this.username,
  });

  int id;
  String name;
  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
  };
}




