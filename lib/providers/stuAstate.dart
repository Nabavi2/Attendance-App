import 'package:flutter/material.dart';

class StuAndState with ChangeNotifier {
  final String stuId;
  String stateId;
  StuAndState({@required this.stuId, this.stateId = "1"});
}

class StudentsAstates with ChangeNotifier {
 
  // EmpAndState findById(String eId) {
  //   return _items.firstWhere((es) => es.empId == eId);
  // }
}
