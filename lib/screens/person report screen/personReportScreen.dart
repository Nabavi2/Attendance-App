import 'package:Attendece/models/student_allReport.dart';
import 'package:Attendece/widgets/person_report_Tile.dart';

import 'package:flutter/material.dart';



class PersonReportScreen extends StatefulWidget {
  static const routeName = "/reportScreen";
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<PersonReportScreen> {
  @override
  Widget build(BuildContext context) {
    var stuReportList = ModalRoute.of(context).settings.arguments
        as List<StudentAttendanceReport>;
    stuReportList.sort((a, b) => a.date.compareTo(b.date));
    return Scaffold(
        appBar: AppBar(title: Text(stuReportList[0].fullName)),
        body: ListView.builder(
          itemCount: stuReportList.length,
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: PersonRprtTile(
                date: stuReportList[i].date,
                state: stuReportList[i].asPersianName,
                day: stuReportList[i].persianName,
                month: stuReportList[i].monthName,),
          ),
        ));
  }
}
