import 'package:Attendece/models/stu_atte_report.dart';
import 'package:Attendece/models/stu_report_timeAndId.dart';
import 'package:Attendece/models/student_allReport.dart';
import 'package:Attendece/models/user_data.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart';

class AllReport with ChangeNotifier {
  String positionId;
  Map<String, String> mainDates;
  int present;
  int absent;
  Map<String, List<StudentAttendanceReport>> oreportItems = {};
  List<StudentAttendanceReport2> singleReportItems = [];
  List<String> _stuNames = [];
  List<String> get stuNames {
    return [..._stuNames];
  }

  void setDates(Map dates) {
    mainDates = dates;
    notifyListeners();
  }

  List<ClassesList> _classes = [];

  List<ClassesList> get classes {
    return [..._classes];
  }

  Future<void> fetchClassesList({String timeDay}) async {
    final url3 = "http://172.16.1.71/course_final/public/api/getClass/$timeDay";
    final response = await get(url3);
    try {
      if (response.statusCode == 200) {
        final extractedData3 = stuAttewithTimeFromJson(response.body);
        _classes = extractedData3.toList();
        // debugPrint("TITITITITITITIMMMM" + response.body);
      }
    } catch (error) {
      throw "Can't fetch Data";
    }
  }

  Future<void> fetchWithIdReport({String studentId}) async {
    final url2 =
        "http://172.16.1.71/course_final/public/api/getStudentAttendanceReportWithID/$studentId";
    final response = await get(url2);

    try {
      if (response.statusCode == 200) {
        final extractedData = stuAtteReportFromJson(response.body);
        var a = extractedData;

        singleReportItems = a.studentAttendanceReport;
        // debugPrint("LALALALALALALAL2222222" + singleReportItems.toString());

      }
    } catch (error) {
      throw error.toString() + "elelelele";
    }
  }

  Future<void> fetchAllReports({
    String classShift,
    String stId = "all",
    String classId,
    String fDate,
    String sDate,
    bool isInternal = false,
  }) async {
    final firstDate = isInternal ? fDate : mainDates["first"];
    final secondDate = isInternal ? sDate : mainDates["second"];

    final url =
        "http://172.16.1.71/course_final/public/attendance/getStudentAttendanceReportWithOutID?st_id=$stId&class_id=$classId&class_shift=$classShift&f_date=$firstDate&s_date=$secondDate";
    final response = await get(url);
    debugPrint(response.body.toString() + " RESPONSE PRINT");
    try {
      if (response.statusCode == 200) {
        final extractedData = jsonDecode(response.body) as Map<String, dynamic>;

        StudentAllReport ar = StudentAllReport.fromJson(extractedData);
        final items = ar.studentAttendanceReport;
        debugPrint("ALL REPORT.EXTRACTEDDATA" + extractedData.toString());
        debugPrint("ALL REPORT RESPONSE.BODY" + response.body.toString());
        present = ar.present;
        absent = ar.absent;
        if (stId != "all") {
          oreportItems = items as Map;
          notifyListeners();
        } else {
          // This loop is for adding employee names to list of empNames.
          for (var i in items) {
            if (!_stuNames.contains(i.fullName)) {
              _stuNames.add(i.fullName);
            }
          }

          // This loop is for adding key and data of  that key to MAP of reportItems.
          for (String name in stuNames) {
            List<StudentAttendanceReport> prtStudent =
                items.where((s) => s.fullName == name).toList();

            oreportItems[name] = prtStudent;
          }
        }
      } else {
        throw "Can't fetch data";
      }
    } catch (error) {
      debugPrint(error.toString() + "ERROR OF FETCH ALL REPORT");
    }
    notifyListeners();
  }
}
