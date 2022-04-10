import 'package:Attendece/models/stu_report_timeAndId.dart';
import 'package:Attendece/models/student_allReport.dart';
import 'package:Attendece/providers/allReport.dart';
import 'package:Attendece/providers/class_data.dart';
import 'package:Attendece/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:afghan_datepicker/AfghanDatePickerLocale.dart';
import 'package:afghan_datepicker/afghan_datepicker.dart';
import 'package:persian_datepicker/persian_datetime.dart';
import 'package:provider/provider.dart';

import './publicReportTile.dart';

class PublicReportScreen extends StatefulWidget {
  final Map dates;
  

  PublicReportScreen({this.dates});
  static const routeName = "/allReport";
  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<PublicReportScreen> {
  List<String> timeList = ["بعد از ظهر", "قبل از ظهر"];
  
  var item;
  final _form = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();
  TextEditingController _firstDate = TextEditingController();
  TextEditingController _secondDate = TextEditingController();
  TextEditingController _classId = TextEditingController();
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
          .fetchAllReports(
        // classShift: widget.classShift,
        // stId: "all",
        // classId: _classId.text,
        // fDate: _firstDate.text,
        // sDate: _secondDate.text,
        // isInternal: true,
      )
          .then((_) {
        setState(() {
          _isLoading = false;
        });
        Provider.of<AllReport>(context, listen: false)
        .fetchClassesList(timeDay: item);
        _firstDate = TextEditingController(text: widget.dates["first"]);
        _secondDate = TextEditingController(text: widget.dates["second"]);
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
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<AllReport>(context);
    List<ClassesList> _classesList = Provider.of<AllReport>(context).classes;
    List<String> classNames = _classesList.map((e) => e.className).toList();
    // String empType =
    //     Provider.of<DaysAndTime>(context).findPoById(provider.positionId);
    final stuNameList = provider.stuNames;
    debugPrint(list.length.toString() + "STUDENT LIST OF ...IN PUBLIC");
    final dates = provider.mainDates;
    return Scaffold(
      appBar: AppBar(title: Text("لیست گزارشات شاگردان")),
      drawer: MainDrawer(),
      body: _isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: pubCo,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                          ),
                          width: size.width * 0.6,
                          height: size.height * 0.05,
                          child: Form(
                            key: _form,
                            child: TextFormField(
                              controller: _classId,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                )),
                                contentPadding:
                                    EdgeInsets.only(right: size.width * 0.025),
                                hintText: "ایدی کلاس",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "لطفاً ای دی کلاس مربوطه را وارد کنید!";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Form(
                            key: _form2,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Text("از تاریخ:"),
                                    SizedBox(width: 5),
                                    SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                                // hintText: dates["first"]
                                                ),
                                            onChanged: (_) {
                                              setState(() {
                                                _isFirst = false;
                                              });
                                            },
                                            controller: _firstDate,
                                            textAlign: TextAlign.center,
                                            enableInteractiveSelection: false,
                                            onTap: () {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) => Center(
                                                          child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 10,
                                                        ),
                                                        width: double.infinity,
                                                        child: afDP1,
                                                      )));
                                            }))
                                  ]),
                                  Row(children: [
                                    Text("الی تاریخ:"),
                                    SizedBox(width: 5),
                                    SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                                // hintText: dates["second"]
                                                ),
                                            onChanged: (_) {
                                              setState(() {
                                                _isFirst = false;
                                              });
                                            },
                                            controller: _secondDate,
                                            textAlign: TextAlign.center,
                                            enableInteractiveSelection: false,
                                            validator: (val) {
                                              PersianDateTime pd1 =
                                                  new PersianDateTime(
                                                      jalaaliDateTime:
                                                          _firstDate.text);
                                              PersianDateTime pd2 =
                                                  new PersianDateTime(
                                                      jalaaliDateTime: val);
                                              if (pd1.isAfter(pd2)) {
                                                return "لطفاً تاریخ درست را وارد کنید!";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onTap: () {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) => Center(
                                                          child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        width: double.infinity,
                                                        child: afDP2,
                                                      )));
                                            })),
                                  ]),

                                  //This button show fetches the data from the server and then shows the list of the
                                  //requested reports of the employees.

                                  //Also for the first time when the user navigates to this page shows the reports
                                  //of the employees that the dates of that is specified in the pervious page.
                                ]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ElevatedButton(
                                child: Text("نمایش"),
                                onPressed: () {
                                  setState(() {
                                    _isInLoading = true;
                                  });
                                  Provider.of<AllReport>(context, listen: false)
                                      .fetchAllReports(
                                          classShift: item,
                                          stId: 'all',
                                          classId: _classId.text,
                                          fDate: _firstDate.text,
                                          sDate: _secondDate.text,
                                          isInternal: true)
                                      .then(
                                    (_) {
                                      setState(
                                        () {
                                          _isInLoading = false;
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                             DropdownButton(
                            elevation: 5,
                            dropdownColor: Colors.blue,
                            items: timeList
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        item.toString(),
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            value: item,
                            onChanged: (newItem) {
                              item = newItem;
                            },
                          ),
                          DropdownButton(
                          elevation: 5,
                          dropdownColor: Colors.black87,
                          items: classNames
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      item.toString(),
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: item,
                          onChanged: (newItem) {
                            item = newItem;
                          },
                        ),
                          ],
                        ),
                        SizedBox(height: 5, child: Container(color: pubCo)),
                        SizedBox(height: 5),
                        
                      ]),
                ),
                Expanded(
                  child: Container(
                    width: 400,
                    height: 600,
                    child: _isInLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            // itemExtent: 160,
                            itemCount: list.length,
                            itemBuilder: (ctx, i) => PubRepTile(stuNameList[i]),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
