// // To parse this JSON data, do
// //
// //     final userData = userDataFromJson(jsonString);

// import 'dart:convert';

// import 'package:flutter/cupertino.dart';

// List<UserData> userDataFromJson(String str) =>
//     List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

// String userDataToJson(List<UserData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserData with ChangeNotifier {
//   UserData({
//     this.classId,
//     this.className,
//     this.startTime,
//     this.endTime,
//     this.fullName,
//   });

//   int classId;
//   String className;
//   String startTime;
//   String endTime;
//   String fullName;

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         classId: json["class_id"],
//         className: json["class_name"],
//         startTime: json["start_time"],
//         endTime: json["end_time"],
//         fullName: json["full_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "class_id": classId,
//         "class_name": className,
//         "start_time": startTime,
//         "end_time": endTime,
//         "full_name": fullName,
//       };
// }

// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<UserData> userDataFromJson(String str) => List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData with ChangeNotifier {
    UserData({
        this.classId,
        this.className,
        this.startTime,
        this.endTime,
        this.fullName,
    });

    int classId;
    String className;
    String startTime;
    String endTime;
    String fullName;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        classId: json["class_id"],
        className: json["class_name"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "class_id": classId,
        "class_name": className,
        "start_time": startTime,
        "end_time": endTime,
        "full_name": fullName,
    };
     
     
}



// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);



Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student  with ChangeNotifier{
    Student({
        this.student,
        this.attendanceType,
    });

    List<StudentElement> student;
    List<AttendanceType> attendanceType;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        student: List<StudentElement>.from(json["student"].map((x) => StudentElement.fromJson(x))),
        attendanceType: List<AttendanceType>.from(json["attendanceType"].map((x) => AttendanceType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "student": List<dynamic>.from(student.map((x) => x.toJson())),
        "attendanceType": List<dynamic>.from(attendanceType.map((x) => x.toJson())),
    };
}

class AttendanceType {
    AttendanceType({
        this.attendanceStatusId,
        this.englishName,
        this.persianName,
    });

    int attendanceStatusId;
    String englishName;
    String persianName;

    factory AttendanceType.fromJson(Map<String, dynamic> json) => AttendanceType(
        attendanceStatusId: json["attendance_status_id"],
        englishName: json["english_name"],
        persianName: json["persian_name"],
    );

    Map<String, dynamic> toJson() => {
        "attendance_status_id": attendanceStatusId,
        "english_name": englishName,
        "persian_name": persianName,
    };
}

class StudentElement with ChangeNotifier{
    StudentElement({
        this.stId,
        this.fullName,
        this.fatherName,
    });

    int stId;
    String fullName;
    String fatherName;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
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
