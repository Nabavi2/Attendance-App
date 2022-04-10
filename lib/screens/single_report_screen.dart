import 'package:Attendece/providers/allReport.dart';
import 'package:Attendece/providers/class_data.dart';

import 'package:Attendece/widgets/mainDrawer.dart';
import 'package:Attendece/widgets/person_report_Tile.dart';
import 'package:afghan_datepicker/AfghanDatePickerLocale.dart';
import 'package:afghan_datepicker/afghan_datepicker.dart';
import 'package:flutter/material.dart';
import 'package:persian_datepicker/persian_datetime.dart';
import 'package:provider/provider.dart';

class SingleReportScreen extends StatefulWidget {
  static const routeName = "/singlReport";

  final String stuId;
  final Map dates;
  final String classShift;
  // String name;
  SingleReportScreen({this.dates, this.stuId, this.classShift});
  @override
  _SingleReportScreenState createState() => _SingleReportScreenState();
}

class _SingleReportScreenState extends State<SingleReportScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController _firstDate = TextEditingController();
  TextEditingController _secondDate = TextEditingController();
  AfghanDatePickerWidget afDP1;
  AfghanDatePickerWidget afDP2;

  bool _isInit = true;
  bool _isLoading = false;
  bool _isInLoading = false;
  bool _isFirst = true;
  Color pubCo = Colors.orangeAccent;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AllReport>(context)
          .fetchWithIdReport(
        studentId: widget.stuId,
      )
          .then((_) {
        setState(() {
          _isLoading = false;
        });
        // _firstDate = TextEditingController(text: widget.dates["first"]);
        // _secondDate = TextEditingController(text: widget.dates["second"]);
      });
    }
    _isInit = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    afDP1 = AfghanDatePicker(
      outputFormat: 'YYYY/MM/DD',
      controller: _firstDate,
      locale: AfghanDatePickerLocale.DARI,
      farsiDigits: false,
    ).init();
    afDP2 = AfghanDatePicker(
      outputFormat: 'YYYY/MM/DD',
      controller: _secondDate,
      locale: AfghanDatePickerLocale.DARI,
      farsiDigits: false,
    ).init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstDate.dispose();
    _secondDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<ClassData>(context);
    final list = name.student;
    //  final name = Provider.of<ClassData>(context).findById(widget.stuId);
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<AllReport>(context);
    final stuReportList = provider.singleReportItems;
    stuReportList.sort((a, b) => a.date.compareTo(b.date));
    String presentNum = stuReportList
            .where((stu) => stu.asPersianName == "حاضر")
            .toList()
            .length
            .toString() ??
        "";
    String absentNum = stuReportList
            .where((stu) => stu.asPersianName == "غیر حاضر")
            .toList()
            .length
            .toString() ??
        "";
    String sickNum = stuReportList
            .where((stu) => stu.asPersianName == "مریض")
            .toList()
            .length
            .toString() ??
        "";
    String vacNum = stuReportList
            .where((stu) => stu.asPersianName == "رخصت")
            .toList()
            .length
            .toString() ??
        "";
    String necNum = stuReportList
            .where((stu) => stu.asPersianName == "ضروری")
            .toList()
            .length
            .toString() ??
        "";
 int i = int.parse(widget.stuId);
  
    String appBarText =
        list.length > 0 ? list[i].fullName : "";
        
       //debugPrint("LENGTH OF LIST" +list.length.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("گزارش حاضری :  " + appBarText, style: TextStyle(color: Colors.white)),
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : Column(children: [
              Expanded(
                child: _isInLoading
                    ? Container(
                        child: Center(child: CircularProgressIndicator()))
                    : SingleChildScrollView(
                        child: Column(children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: double.infinity,
                          height: size.height * 0.3,
                          child: Card(
                              color: Colors.green,
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 22.0, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("کلیات گزارش:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("حاضر:  $presentNum روز",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                            Text("مریض:  $sickNum روز",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                            Text("ضروری:  $necNum روز",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("غیر حاضر:  $absentNum روز",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                            Text("رخصت:  $vacNum روز",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                            Text("سیتبمنصثهک",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.green))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(height: 5),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: stuReportList.length,
                          itemBuilder: (ctx, i) => PersonRprtTile(
                              date: stuReportList[i].date.toString(),
                              day: stuReportList[i].persianName,
                              state: stuReportList[i].asPersianName,
                              month: stuReportList[i].monthName),
                        ),
                      ])),
              ),
            ]),
    );
  }
}
