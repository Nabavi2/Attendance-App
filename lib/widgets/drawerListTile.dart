import 'package:Attendece/providers/allReport.dart';
import 'package:Attendece/screens/public%20report%20screen/publicRerport.dart';
import 'package:Attendece/screens/single_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:afghan_datepicker/AfghanDatePickerLocale.dart';
import 'package:afghan_datepicker/afghan_datepicker.dart';

import 'package:persian_datepicker/persian_datetime.dart';
import 'package:provider/provider.dart';

class DrawerListTile extends StatefulWidget {
  @override
  _DrawerListTileState createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  final _form1 = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();
  final _form = GlobalKey<FormState>();
  

  TextEditingController _textEditingController1 = TextEditingController();

  TextEditingController _textEditingController2 = TextEditingController();

  TextEditingController _stuId = TextEditingController();

  TextEditingController _tec2 = TextEditingController();

  TextEditingController _tec3 = TextEditingController();

  TextEditingController _tec4 = TextEditingController();
  TextEditingController _dayTime = TextEditingController();
  AfghanDatePickerWidget afghanDatePicker1;

  AfghanDatePickerWidget afghanDatePicker2;

  AfghanDatePickerWidget adp1;

  AfghanDatePickerWidget adp2;

  String m1 = "لطفاً یک تاریخ انتخاب کنید!";

  @override
  void initState() {
    afghanDatePicker1 = AfghanDatePicker(
      outputFormat: 'YYYY/M/DD',
      controller: _textEditingController1,
      locale: AfghanDatePickerLocale.DARI,
      farsiDigits: false,
    ).init();
    afghanDatePicker2 = AfghanDatePicker(
      outputFormat: 'YYYY/M/DD',
      controller: _textEditingController2,
      locale: AfghanDatePickerLocale.DARI,
      farsiDigits: false,
    ).init();
    adp1 = AfghanDatePicker(
      outputFormat: 'YYYY/M/DD',
      controller: _tec3,
      locale: AfghanDatePickerLocale.DARI,
      farsiDigits: false,
    ).init();

    adp2 = AfghanDatePicker(
      outputFormat: 'YYYY/M/DD',
      controller: _tec4,
      locale: AfghanDatePickerLocale.DARI,
      farsiDigits: false,
    ).init();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController1.dispose();
    _textEditingController2.dispose();
    _stuId.dispose();
    _tec2.dispose();
    _tec3.dispose();
    _tec4.dispose();
    super.dispose();
  }

  void _saveForm1() {
    final isValid = _form1.currentState.validate();
    if (!isValid) {
      return;
    }
    _form1.currentState.save();
    Map<String, String> dates = {
      "first": _textEditingController1.text,
      "second": _textEditingController2.text
    };
    Provider.of<AllReport>(context, listen: false).setDates(dates);
    // Provider.of<AllReport>(context, listen: false)
    //     .fetchClassesList(timeDay: item);
    // Provider.of<AllReport>(context, listen: false)
    //   .fetchAllReports(classShift: _dayTime.text);
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PublicReportScreen(

        ),
      ),
    );
  }

  void _saveForm2() {
    final isValid = _form2.currentState.validate();
    if (!isValid) {
      return;
    }
    _form2.currentState.save();

    Map<String, String> dates = {
      "first": _tec3.text,
      "second": _tec4.text,
    };
    Provider.of<AllReport>(context, listen: false).setDates(dates);
    Provider.of<AllReport>(context, listen: false)
        .fetchWithIdReport(studentId: _stuId.text);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => SingleReportScreen(
          classShift: _dayTime.text,
          dates: dates,
          stuId: _stuId.text,
        ),
      ),
    );
  }

// do the compare validation and the empty validation of the text fields....
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expanded ? 180 : 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: Icon(Icons.report),
              title: Text(" گزارشات",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  )),
              trailing: IconButton(
                  icon: _expanded
                      ? Icon(Icons.expand_less)
                      : Icon(Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  }),
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              }),
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expanded ? 95 : 0,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                          leading: Icon(Icons.trip_origin),
                          title: Text("همه"),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PublicReportScreen()));
                          }),
                      ListTile(
                          leading: Icon(Icons.trip_origin),
                          title: Text("فرد مشخص"),
                          onTap: () {
                            personShowDialog(context);
                          }),
                    ]),
              ))
        ],
      ),
    );
  }

  Future personShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("گزارش فرد"),
              content: Container(
                height: 150,
                width: 100,
                child: Form(
                  key: _form2,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("آدی دی:"),
                              SizedBox(width: 5),
                              SizedBox(
                                  width: 155,
                                  height: 75,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: _stuId,
                                    keyboardType: TextInputType.number,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "لطفاً آدی دی را وارد کنید!";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(height: 30),
                          // BigDatePicker(
                          //    // m1: m1,
                          //    // afghanDatePicker1: adp1,
                          //     textEditingController1: _tec3,
                          //     afghanDatePicker2: adp2,
                          //    // textEditingController2: _tec4
                          //    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                    child: Text("تأیید"),
                    onPressed: () {
                      _saveForm2();
                    }),
                TextButton(
                  child: Text(
                    "بازگشت",
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  // Future allShowDialog(BuildContext context) {
  //    return 
  //   // showDialog(
  //   //   context: context,
  //   //   builder: (ctx) => AlertDialog(
  //   //     title: Text("گزارش تمام شاگردان"),
  //   //     content: Container(
  //   //       height: 350,
  //   //       width: 200,
  //   //       child: Form(
  //   //         key: _form1,
  //   //         child: Scrollbar(
  //   //           child: SingleChildScrollView(
  //   //             child: Column(
  //   //               children: [
  //   //                 Row(
  //   //                   children: [
  //   //                     Text("اوقات روز:"),
  //   //                     SizedBox(width: 5),
  //   //                     SizedBox(
  //   //                       width: 155,
  //   //                       height: 75,
  //   //                       // child: DropdownButton(
  //   //                       //   elevation: 5,
  //   //                       //   dropdownColor: Colors.blue,
  //   //                       //   items: timeList
  //   //                       //       .map(
  //   //                       //         (item) => DropdownMenuItem(
  //   //                       //           value: item,
  //   //                       //           child: Padding(
  //   //                       //             padding:
  //   //                       //                 const EdgeInsets.only(right: 10.0),
  //   //                       //             child: Text(
  //   //                       //               item.toString(),
  //   //                       //               style: TextStyle(
  //   //                       //                   fontSize: 14, color: Colors.black87),
  //   //                       //             ),
  //   //                       //           ),
  //   //                       //         ),
  //   //                       //       )
  //   //                       //       .toList(),
  //   //                       //   value: item,
  //   //                       //   onChanged: (newItem) {
  //   //                       //     item = newItem;
  //   //                       //   },
  //   //                       // ),
  //   //                     ),

  //   //                     // TextFormField(
  //   //                     //   textAlign: TextAlign.center,
  //   //                     //   controller: _dayTime,
  //   //                     //   keyboardType: TextInputType.text,
  //   //                     //   validator: (val) {
  //   //                     //     if (val.isEmpty) {
  //   //                     //       return "لطفاً اوقات را وارد کنید!";
  //   //                     //     } else {
  //   //                     //       return null;
  //   //                     //     }
  //   //                     //   },
  //   //                     // ),
  //   //                   ],
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 15,
  //   //                 ),
  //   //                 SizedBox(height: 30),
  //   //                 BigDatePicker(
  //   //                     m1: m1,
  //   //                     afghanDatePicker1: afghanDatePicker1,
  //   //                     textEditingController1: _textEditingController1,
  //   //                     afghanDatePicker2: afghanDatePicker2,
  //   //                     textEditingController2: _textEditingController2),
  //   //               ],
  //   //             ),
  //   //           ),
  //   //         ),
  //   //       ),
  //   //     ),
  //   //     actions: [
  //   //       TextButton(
  //   //           child: Text("تأیید",
  //   //               style: TextStyle(color: Theme.of(context).primaryColor)),
  //   //           onPressed: () {
  //   //             setState(() {
  //   //               _saveForm1();
  //   //             });
  //   //           }),
  //   //       TextButton(
  //   //           child: Text("بازگشت",
  //   //               style: TextStyle(color: Theme.of(context).primaryColor)),
  //   //           onPressed: () {
  //   //             Navigator.of(context).pop();
  //   //           }),
  //   //     ],
  //   //   ),
  //   // );
  // }
}

class BigDatePicker extends StatefulWidget {
  const BigDatePicker({
    Key key,
    @required this.m1,
    @required this.afghanDatePicker1,
    @required TextEditingController textEditingController1,
    @required this.afghanDatePicker2,
    @required TextEditingController textEditingController2,
  })  : _textEditingController1 = textEditingController1,
        _textEditingController2 = textEditingController2,
        super(key: key);

  final String m1;
  final AfghanDatePickerWidget afghanDatePicker1;
  final TextEditingController _textEditingController1;
  final AfghanDatePickerWidget afghanDatePicker2;
  final TextEditingController _textEditingController2;

  @override
  _BigDatePickerState createState() => _BigDatePickerState();
}

class _BigDatePickerState extends State<BigDatePicker> {
  @override
  Widget build(BuildContext context) {
    //List<EmployeeP> positions = Provider.of<DaysAndTime>(context).positions;
    // List<String> _positionItems =
    //     positions.map((emp) => emp.positionName).toList();
    // String selectedPosition;

    return Column(children: [
      Row(
        children: [
          // Text("نوعیت کارمند:"),
          // SizedBox(width: 5),
          // SizedBox(
          //   width: 110,
          //   child: DropdownButtonFormField(
          //       validator: (val) {
          //         if (val.isEmpty) {
          //           return "لطفاً نوعیت کارمند را انتخاب کنید!";
          //         } else {
          //           return null;
          //         }
          //       },
          //       decoration: InputDecoration(
          //           border: UnderlineInputBorder(
          //               borderSide: BorderSide(color: Colors.black))),
          //       items: _positionItems
          //           .map((item) => DropdownMenuItem(
          //               value: item,
          //               child: Padding(
          //                 padding: const EdgeInsets.only(right: 15.0),
          //                 child: Text(item,
          //                     textAlign: TextAlign.center,
          //                     style:
          //                         TextStyle(fontSize: 14, color: Colors.black)),
          //               )))
          //           .toList(),
          //       value: selectedPosition,
          //       onChanged: (newItem) {
          //         setState(() {
          //           selectedPosition = newItem;
          //           final empPo =
          //               Provider.of<DaysAndTime>(context, listen: false)
          //                   .findEmpByName(selectedPosition);
          //           Provider.of<AllReport>(context, listen: false)
          //               .setPosition(empPo.positionId.toString());
          //         });
          //       }),
          // ),
        ],
      ),
      SizedBox(height: 10),
      Row(children: [
        Text("از تاریخ: "),
        SizedBox(
            height: 80,
            width: 155,
            child: TextFormField(
                textAlign: TextAlign.center,
                validator: (val) {
                  if (val.isEmpty) {
                    return widget.m1;
                  } else {
                    return null;
                  }
                },
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDialog(
                      context: context,
                      builder: (ctx) => Center(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              height: 450,
                              child: widget.afghanDatePicker1)));
                },
                controller: widget._textEditingController1))
      ]),
      Row(children: [
        Text("الی تاریخ: "),
        SizedBox(
            height: 80,
            width: 155,
            child: TextFormField(
              textAlign: TextAlign.center,
              validator: (val) {
                if (val.isEmpty) {
                  return "لطفاً یک تاریخ انتخاب کنید!";
                }
                PersianDateTime pd1 = PersianDateTime(
                    jalaaliDateTime: widget._textEditingController1.text);
                PersianDateTime pd2 = PersianDateTime(jalaaliDateTime: val);

                if (pd1.isAfter(pd2)) {
                  return "لطفاً تاریخ درست را وارد کنید!";
                } else {
                  return null;
                }
              },
              enableInteractiveSelection: false,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                showDialog(
                    context: context,
                    builder: (ctx) => Center(
                            child: Container(
                          height: 450,
                          padding: EdgeInsets.all(10),
                          child: widget.afghanDatePicker2,
                        )));
              },
              controller: widget._textEditingController2,
            ))
      ]),
    ]);
  }
}
