import 'package:Attendece/screens/dailyListScreen.dart';
import 'package:flutter/material.dart';
import '../providers/class_data.dart';
import 'package:provider/provider.dart';

class ScreenView extends StatefulWidget {
  @override
  _ScreenViewState createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
 // ClassData classData = new ClassData();

  var _isLoading = false;
  var isInit = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (isInit) {
      setState(() {
        _isLoading = true;
      });
    Provider.of<ClassData>(context).fetchAndSet().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    isInit = false;

    super.didChangeDependencies();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   classData.fetchAndSet().then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });

  // }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClassData>(context).classes;
    print(provider.length.toString() + "MY LIST LENGHT");
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Lis'),
      ),
      body: 
      _isLoading
          ? Center(child: CircularProgressIndicator())
          : DailyListScreen(),
          //  ListView.builder(
          //   itemCount: provider.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: Column(
          //           children: [
          //             ListTile(
          //               title:
          //                   Text(provider[index].classId.toString()),
          //               subtitle: Text(provider[index].className),

          //             ),
          //             ListTile(
          //               title:
          //                   Text(provider[index].startTime),
          //               subtitle: Text(provider[index].fullName),
          //             ),
          //             ListTile(
          //               title:
          //                   Text(provider[index].endTime),
                       
          //             ),
          //           ],
          //         ),

          //       );

          //     },

          //   ),
    );
  }
}
