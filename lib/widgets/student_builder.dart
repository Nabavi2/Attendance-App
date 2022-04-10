import 'package:Attendece/models/user_data.dart';
import 'package:Attendece/providers/class_data.dart';
import 'package:Attendece/providers/stuAstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './listTileRow.dart';

class StudenteBuilder extends StatelessWidget {
  String classId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final list = Provider.of<ClassData>(context).student;
    debugPrint(list.length.toString() + "List LENGTHhhhhhhhhhhh");

    // List<String> empIdes = list.map((e) => e.employeeId).toList();
    // final studentList =
    //     Provider.of<ClassData>(context).student;
    return
        // studentList == null
        //     ? Text("آیدی کلاس وارد نشده است")
        //     :
        ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) => Column(children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          title: Text(
            list[i].fullName,
          ),
          subtitle: Text(
            list[i].stId.toString(),
          ),
          trailing: ChangeNotifierProvider(
              create: (ctx) => StudentElement(
                    stId: list[i].stId,
                    fullName: list[i].fullName,
                    fatherName: list[i].fatherName
                  ),
              child: ListTileRow()),
        ),
        Divider(indent: 18, endIndent: 18, color: Colors.black26),
      ]),
    );
  }
}
