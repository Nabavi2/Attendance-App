


import 'package:Attendece/providers/class_data.dart';

import '../providers/stuAstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';

class ListTileRow extends StatelessWidget {
  static const IconData cancel_outlined =
      IconData(0xe0c9, fontFamily: 'MaterialIcons');

  Widget build(BuildContext context) {
    String selectedItem;
    StudentElement stu = Provider.of<StudentElement>(context);
    var stuAsta = Provider.of<ClassData>(context);
    StuAndState stAs = stuAsta.stAsfindById(stu.stId.toString());
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: stAs.stateId == "1"
                ? Icon(Icons.check_circle, color: Color(0xff507ce0))
                : Icon(Icons.check_circle_outline),
            onPressed: () {
              if (stAs.stateId != "1") {
                stAs.stateId = "1";
              } else {
                stAs.stateId = "2";
              }

              stuAsta.updateItem(stu.stId.toString(), stAs.stateId);
            }),
        IconButton(
            icon: Icon(Icons.clear, color:  stAs.stateId == "2" ? Colors.red : Colors.grey),
            onPressed: () {
              if (stAs.stateId != "2") {
                stAs.stateId = "2";

                stuAsta.updateItem(stu.stId.toString(), stAs.stateId);
              } else {
                stAs.stateId = "1";

                stuAsta.updateItem(stu.stId.toString(), stAs.stateId);
              }
            }),
        PopupMenuButton(
          icon: Icon(Icons.announcement,
              color: !(stAs.stateId == "1" || stAs.stateId == "2")
                  ? Colors.indigo
                  : Colors.grey),
          initialValue: selectedItem,
          itemBuilder: (ctx) => [
            PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.airline_seat_flat,
                        color:
                            stAs.stateId == "3" ? Colors.indigo : Colors.grey),
                    SizedBox(width: 5),
                    Text("مریض"),
                  ],
                ),
                value: "3"),
            PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.work,
                        color:
                            stAs.stateId == "4" ? Colors.indigo : Colors.grey),
                    SizedBox(width: 5),
                    Text("ضروری"),
                  ],
                ),
                value: "4"),
            PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.home,
                        color:
                            stAs.stateId == "5" ? Colors.indigo : Colors.grey),
                    SizedBox(width: 5),
                    Text("رخصت"),
                  ],
                ),
                value: "5"),
          ],
          onSelected: (val) {
            stAs.stateId = val;
            selectedItem = val;
            stuAsta.updateItem(stu.stId.toString(), stAs.stateId);
          },
        ),
        ],
    );
  }
}
