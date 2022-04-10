// To parse this JSON data, do
//
//     final allReport = allReportFromJson(jsonString);

import 'dart:convert';

StudentAllReport allReportFromJson(String str) => StudentAllReport.fromJson(json.decode(str));

String allReportToJson(StudentAllReport data) => json.encode(data.toJson());

class StudentAllReport {
    StudentAllReport({
        this.studentAttendanceReport,
        this.present,
        this.absent,
    });

    List<StudentAttendanceReport> studentAttendanceReport;
    int present;
    int absent;

    factory StudentAllReport.fromJson(Map<String, dynamic> json) => StudentAllReport(
        studentAttendanceReport: List<StudentAttendanceReport>.from(json["studentAttendanceReport"].map((x) => StudentAttendanceReport.fromJson(x))),
        present: json["present"],
        absent: json["absent"],
    );

    Map<String, dynamic> toJson() => {
        "studentAttendanceReport": List<dynamic>.from(studentAttendanceReport.map((x) => x.toJson())),
        "present": present,
        "absent": absent,
    };
}

class StudentAttendanceReport {
    StudentAttendanceReport({
        this.persianName,
        this.monthName,
        this.date,
        this.asPersianName,
        this.fullName,
    });

    String persianName;
    String monthName;
    String date;
    String asPersianName;
    String fullName;

    factory StudentAttendanceReport.fromJson(Map<String, dynamic> json) => StudentAttendanceReport(
        persianName: json["persian_name"],
        monthName: json["month_name"],
        date: json["date"],
        asPersianName: json["as_persian_name"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "persian_name": persianName,
        "month_name": monthName,
        "date": date,
        "as_persian_name": asPersianName,
        "full_name": fullName,
    };
}
