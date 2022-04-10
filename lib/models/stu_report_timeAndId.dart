// To parse this JSON data, do
//
//     final stuAttewithTime = stuAttewithTimeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<ClassesList> stuAttewithTimeFromJson(String str) =>
    List<ClassesList>.from(
        json.decode(str).map((x) => ClassesList.fromJson(x)));

String stuAttewithTimeToJson(List<ClassesList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassesList {
  ClassesList({
    this.classId,
    this.className,
    this.fullName,
  });

  int classId;
  String className;
  String fullName;

  factory ClassesList.fromJson(Map<String, dynamic> json) =>
      ClassesList(
        classId: json["class_id"],
        className: json["class_name"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "class_id": classId,
        "class_name": className,
        "full_name": fullName,
      };
}
// this Line is seprated two class -------------------------
// To parse this JSON data, do
//
//     final stuAttewithId = stuAttewithIdFromJson(jsonString);

List<StuAttewithId> stuAttewithIdFromJson(String str) =>
    List<StuAttewithId>.from(
        json.decode(str).map((x) => StuAttewithId.fromJson(x)));

String stuAttewithIdToJson(List<StuAttewithId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StuAttewithId with ChangeNotifier {
  StuAttewithId({
    this.stId,
    this.fullName,
    this.fatherName,
  });

  int stId;
  String fullName;
  String fatherName;

  factory StuAttewithId.fromJson(Map<String, dynamic> json) => StuAttewithId(
        stId: json["st_id"],
        fullName: json["full_name"],
        fatherName: json["father_name"],
      );

  Map<String, dynamic> toJson() => {
        "st_id": stId,
        "full_name": fullName,
        "father_name": fatherName,
      };
}
