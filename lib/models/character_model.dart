import 'package:flutter/material.dart';

class Character with ChangeNotifier {
  int id;
  String name;
  String status;
  String species;
  String gender;
  String imageUrl;

  Character.fromMap(Map<String, dynamic> map)
      : id = map["id"] ?? "",
        name = map["name"] ?? "",
        status = map["status"] ?? "",
        species = map["species"] ?? "",
        gender = map["gender"] ?? "",
        imageUrl = map["image"] ?? "";
}
