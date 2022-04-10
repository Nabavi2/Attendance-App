import 'package:Attendece/providers/stuAstate.dart';
import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassData with ChangeNotifier {
  List<UserData> _classes = [];

  List<UserData> get classes {
    return [..._classes];
  }

  List<StudentElement> _student = [];

  List<StudentElement> get student {
    return [..._student];
  }

  List<StuAndState> _items = [];
  List<StuAndState> get items {
    return [..._items];
  }

  void addAll(List<String> stuIdes) {
    final stuIds = stuIdes.map((e) => StuAndState(stuId: e)).toList();
    _items = stuIds;
    notifyListeners();
  }

  // void addItem(String eId, String stId) {
  //   _items.add(EmpAndState(empId: eId, stateId: stId));
  //   notifyListeners();
  // }

  void updateItem(String stuId, String stateId) {
    _items[_items.indexWhere((st) => st.stuId == stuId)] =
        StuAndState(stuId: stuId, stateId: stateId);
    notifyListeners();
  }

  StuAndState stAsfindById(String stuId) {
    final item = _items.firstWhere((es) => es.stuId == stuId);

    return item;
  }

  Future<void> fetchAndSetStudents(String classId) async {
    var url2 =
        "http://172.16.1.71/course_final/public/api/getStudentForAttendance/$classId";
    http.Response response1 = await http.get(url2);
    if (response1.statusCode == 200) {
      var st = studentFromJson(response1.body.toString());
      _student = st.student;
      List<String> stuListId =
          _student.map((item) => item.stId.toString()).toList();
      debugPrint(_student[1].fullName + "  MY STUDENT LIST IS HERE");
      addAll(stuListId);
    }
  }

  findById(String id) {
    List<dynamic> studentName = _student.where((stuId) => stuId == id).toList();
    return studentName;
  }

  Future<void> fetchAndSet() async {
    var url = "http://172.16.1.71/course_final/public/api/studentAttendance";

    http.Response response = await http.get(url);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      _classes = userDataFromJson(response.body.toString());
      debugPrint('MY CONNECTION IS BARQARAR');

      // final extractedData = json.decode(response.body) ;
      // UserData users = new UserData.fromJson(extractedData);
      // _classes = extractedData['extractedData'];
      // _classes = userDataFromJson(response.body);

      //debugPrint(response.body + " MY LIST IS FULL");

      // print(response.body );
      //print(" MY LIST IS FULL");

    }
  }

  final url1 =
      "http://172.16.1.71/course_final/public/api/studentAndTeacherAttendanceCreate";
  int attendanceTeacherId = 1;
  Future<String> sendAttendance({
    String attendanceId,
    String perDate,
    String dayWeekId,
    String student,
  }) async {
    List<String> stuId = _items.map((item) => item.stuId).toList();
    List<String> stateId = _items.map((item) => item.stateId).toList();
    int count1 = 0;
    int count2 = 0;

    try {
      final body = {
        "day_of_week": dayWeekId,
        "year_r": perDate,
        "user_type": "student",
        "attendance_taker_id": attendanceId,
        "class": "4",
        for (var idElement in stuId)
          "student_teacher_id[${count1++}]": idElement,
        for (var idElement in stateId)
          "attendance_status[${count2++}]": idElement,
      };
      debugPrint(body.toString() + "hhhhhhhhhsssssssssssssllll");
      final response = await http.post(url1, body: body);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      // debugPrint(extractedData.toString() + "slslslslslslsl");
      if (extractedData.containsKey("message")) {
        return "اطلاعات ثبت شد!";
      } else {
        var st = extractedData["errors"].toString();
        return st.substring(st.indexOf('خ'), st.indexOf('}')) + "!";
      }
    } catch (error) {
      throw "اطلاعات ثبت نشد!";
    }
  }
}
