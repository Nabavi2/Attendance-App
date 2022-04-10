import 'package:Attendece/providers/allReport.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../person report screen/personReportScreen.dart';

class PubRepTile extends StatelessWidget {
  final String stuName;
  PubRepTile(this.stuName);
  @override
  Widget build(BuildContext context) {
    // Divid the empReportList in to different sections.

    final stuReportList = Provider.of<AllReport>(context).oreportItems[stuName];
debugPrint("AAAAAAAAAAA" + stuReportList.toString()); 
    String presentNum = stuReportList
        .where((element) => element.asPersianName == "حاضر")
        .toList()
        .length
        .toString();

    String absentNum = stuReportList
        .where((element) => element.asPersianName == "غیر حاضر")
        .toList()
        .length
        .toString();

    String sickNum = stuReportList
        .where((element) => element.asPersianName == "مریض")
        .toList()
        .length
        .toString();

    String vacNum = stuReportList
        .where((element) => element.asPersianName == "رخصت")
        .toList()
        .length
        .toString();

    String necNum = stuReportList
        .where((element) => element.asPersianName == "ضروری")
        .toList()
        .length
        .toString();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text("نام:  " + stuName),
            trailing: SizedBox(
              width: 220,
              height: 150,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("حاضر:  " + presentNum),
                      Text("غیر حاضر:  " + absentNum),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("مریض:  " + sickNum),
                      Text("رخصت:  " + vacNum),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(PersonReportScreen.routeName,
                  arguments: stuReportList);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 15),
            child: Text("ضروری:  " + necNum),
          ),
        ],
      ),
    );
  }
}
