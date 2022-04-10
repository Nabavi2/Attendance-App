import 'package:Attendece/models/user_data.dart';
import 'package:Attendece/providers/stuAstate.dart';
import 'package:Attendece/screens/dailyListScreen.dart';
import 'package:flutter/material.dart';
import './screens/screen_view.dart';
import './providers/class_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/stu_report_timeAndId.dart';
import 'screens/person report screen/personReportScreen.dart';
import 'screens/public report screen/publicRerport.dart';
import 'screens/single_report_screen.dart';
import 'widgets/mainDrawer.dart';
import './providers/allReport.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (ctx) => ClassData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (ctx) => StudentElement(), child: DailyListScreen()),
        ChangeNotifierProvider(
            create: (ctx) => StudentsAstates(), child: DailyListScreen()),
        ChangeNotifierProvider(
            create: (ctx) => StuAttewithId(), child: DailyListScreen()),
        ChangeNotifierProvider(
          create: (ctx) => AllReport(),
          child: DailyListScreen(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [Locale("fa", "IR")],
        locale: Locale("fa", "IR"),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: DailyListScreen(),
        routes: {
          DailyListScreen.routeName: (ctx) => DailyListScreen(),
          PersonReportScreen.routeName: (ctx) => PersonReportScreen(),
          PublicReportScreen.routeName: (ctx) => PublicReportScreen(),
          MainDrawer.routeName: (ctx) => MainDrawer(),
          SingleReportScreen.routeName: (ctx) => SingleReportScreen(),
        },
      ),
    );
  }
}
