import 'package:Attendece/models/stu_report_timeAndId.dart';
import 'package:Attendece/providers/allReport.dart';
import 'package:Attendece/providers/class_data.dart';
import 'package:Attendece/widgets/student_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import './main_drawer_screen.dart';
import 'package:provider/provider.dart';

class DailyListScreen extends StatefulWidget {
  static const routeName = "/dailyList";

  @override
  _DailyListScreenState createState() => _DailyListScreenState();
}

class _DailyListScreenState extends State<DailyListScreen> {
  final _form = GlobalKey<FormState>();

  

  void _saveform()  {
     debugPrint(_classId1.text+" this is the IIIIIIIIIIIIIDDDDDDDDDDDDDDD");
    final isValidate = _form.currentState.validate();
    if (!isValidate) {
      return;
    }
   
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    Provider.of<ClassData>(context, listen: false)
        .fetchAndSetStudents(_classId1.text)
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }
TextEditingController _classId1 = TextEditingController();
  // final Jalali jNow = Jalali.now();

  String formatJalaliNow() {
    final Jalali jNow = Jalali.now();
    final f = jNow.formatter;

    return '${f.yyyy}/${f.mm}/${f.dd}';
  }

  String dayOfWeek() {
    DateTime date = DateTime.now();
    debugPrint(date.toString());
    String dateformat = DateFormat.EEEE().format(date);
    debugPrint(dateformat);
    String perDay;
    switch (dateformat) {
      case "Saturday":
        perDay = "شنبه";
        selectedWeekDay = "1";
        break;
      case "Sunday":
        perDay = "یک شنبه";
        selectedWeekDay = "2";
        break;
      case "Monday":
        perDay = "دو شنبه";
        selectedWeekDay = "3";
        break;
      case "Tuesday":
        perDay = "سه شنبه";
        selectedWeekDay = "4";
        break;
      case "Wednesday":
        perDay = "چهار شنبه";
        selectedWeekDay = "5";
        break;
      case "Thursday":
        perDay = "پنج شنبه";
        selectedWeekDay = "6";
        break;
      case "Friday":
        perDay = "جمعه";
        selectedWeekDay = "7";
        break;
    }
    return perDay;
  }

  bool _isLoading = false;
  bool _isInit = true;
  bool _bLoading = false;
  bool _sLoading = false;
  bool _isFloatBtn = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ClassData>(context).fetchAndSet().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
  }

  String selectedWorkTime;
  String selectedWeekDay;
  String selectedstudent;
  double appBar = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    List<ClassesList> _classesList = Provider.of<AllReport>(context).classes;
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ClassData>(context).classes;
    // final provider = Provider.of<UserData>(context).classId;
    // final wdAwk = ModalRoute.of(context).settings.arguments as List<String>;

    // final DateTime today = jNow.toDateTime();

    // List<WeakDay> days = Provider.of<DaysAndTime>(context, listen: false).days;
    // List<EmpWorkTime> times =
    //     Provider.of<DaysAndTime>(context, listen: false).times;
    // List<EmployeeP> positions =
    //     Provider.of<DaysAndTime>(context, listen: false).positions;

    // List<String> _positionItems =
    //     positions.map((emp) => emp.positionName).toList();

    // List<String> _workTimeItems = times.map((wt) => wt.persianName).toList();

    // List<String> _weekDaysItems = days.map((wd) => wd.persianName).toList();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text("حاضری روزانه",
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        actions: [
          //   Padding(
          //       padding: EdgeInsets.only(top: 20, left: 10),
          //       child: Text(formatJalali(jNow),
          //           style: TextStyle(color: Colors.white))),
        ],
      ),
      drawer: MainDrawerScreen(),
      backgroundColor: Theme.of(context).primaryColor,

      body: Column(
        children: [
          SizedBox(height: 5),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(bottom: 20),
            child: Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "تاریخ: ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(width: 7),
                                  SizedBox(
                                      width: 90,
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            canvasColor: Colors.black26),
                                        child: Text(formatJalaliNow(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                      )),
                                ],
                              ),
                              Row(children: [
                                Text(
                                  "روز هفته: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(width: 7),
                                SizedBox(
                                    width: 90,
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          canvasColor: Colors.black26),
                                      child: Text(dayOfWeek(),
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    
                                    controller: _classId1,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      )),
                                      contentPadding: EdgeInsets.only(
                                          right: size.width * 0.025),
                                      hintText: "ایدی کلاس",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
                                    ),
                                    validator: (val) {
                                      if ( val.isEmpty) {
                                        return "لطفاً ای دی کلاس مربوطه را وارد کنید!";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              ElevatedButton(
                                child: Text(" نمایش"),
                                onPressed: (){
                                  _saveform();
                              _classId1.text = "";
                                  // setState(() {
                                  //   _bLoading = true;
                                  // });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                SizedBox(width: 60),
                Expanded(
                  child: Text("نام         آی دی",
                      style: TextStyle(color: Colors.white)),
                ),
                Text("حاضر",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                SizedBox(width: 14),
                Text("غیرحاضر",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                SizedBox(width: 16),
                Text("دیگر",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                SizedBox(width: 14)
              ],
            ),
          ),
          Expanded(
              child: Container(
                  color: Colors.white,
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : StudenteBuilder())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              !_isFloatBtn ? Colors.grey : Theme.of(context).primaryColor,
          child: _sLoading
              ? Theme(
                  data: Theme.of(context)
                      .copyWith(accentColor: Theme.of(context).primaryColor),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              : Icon(Icons.save),
          onPressed: !_isFloatBtn
              ? null
              : () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("هشدار!"),
                      content: Text("آیا می خواهید حاضری در سیستم ثبت شود؟"),
                      actions: [
                        TextButton(
                            child: Text("بله"),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              setState(() {
                                _sLoading = true;
                              });
                              String message = await Provider.of<ClassData>(
                                context,
                                listen: false,
                              )
                                  .sendAttendance(
                                attendanceId: "9",
                                perDate: formatJalaliNow(),
                                dayWeekId: selectedWeekDay,
                              )
                                  .then((val) {
                                setState(() {
                                  _isFloatBtn = false;
                                  _sLoading = false;
                                });
                                return val;
                              });
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(message)));
                            }),
                        TextButton(
                          child: Text("خیر"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
