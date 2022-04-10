// To parse this JSON data, do
//
//     final stuAtteReport = stuAtteReportFromJson(jsonString);

import 'dart:convert';

StuAtteReport stuAtteReportFromJson(String str) => StuAtteReport.fromJson(json.decode(str));

String stuAtteReportToJson(StuAtteReport data) => json.encode(data.toJson());

class StuAtteReport {
    StuAtteReport({
        this.studentAttendanceReport,
        this.present,
        this.absent,
    });

    List<StudentAttendanceReport2> studentAttendanceReport;
    int present;
    int absent;

    factory StuAtteReport.fromJson(Map<String, dynamic> json) => StuAtteReport(
        studentAttendanceReport: List<StudentAttendanceReport2>.from(json["studentAttendanceReport"].map((x) => StudentAttendanceReport2.fromJson(x))),
        present: json["present"],
        absent: json["absent"],
    );

    Map<String, dynamic> toJson() => {
        "studentAttendanceReport": List<dynamic>.from(studentAttendanceReport.map((x) => x.toJson())),
        "present": present,
        "absent": absent,
    };
}

class StudentAttendanceReport2 {
    StudentAttendanceReport2({
        this.persianName,
        this.monthName,
        this.date,
        this.asPersianName,
    });

    String persianName;
    String monthName;
    String date;
    String asPersianName;

    factory StudentAttendanceReport2.fromJson(Map<String, dynamic> json) => StudentAttendanceReport2(
        persianName: json["persian_name"],
        monthName: json["month_name"],
        date: json["date"],
        asPersianName: json["as_persian_name"],
    );

    Map<String, dynamic> toJson() => {
        "persian_name": persianName,
        "month_name": monthName,
        "date": date,
        "as_persian_name": asPersianName,
    };
}
