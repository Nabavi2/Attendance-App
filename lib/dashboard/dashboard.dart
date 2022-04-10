
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: GridView(
            padding: EdgeInsets.only(top: 120, left: 15, right: 10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            //@required this.title, @required this.color, @required this.icon
            children: [
              GestureDetector(
                onTap: () {
                 
                },
                child: Container(
                  // padding: EdgeInsets.only(left:20, right:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            // padding: EdgeInsets.only(top:5),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Icon(Icons.people,
                                size: 90, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              'لیست کارمندان ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.only(left:20, right:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                             padding: EdgeInsets.only(top:5),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Icon(Icons.list_alt_sharp,
                                size: 80, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              'گرفتن حاضری ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.only(left:20, right:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                             padding: EdgeInsets.only(top:5),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Icon(Icons.report_gmailerrorred_outlined,
                                size: 80, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              'گزارشات کلی ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.only(left:20, right:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            // padding: EdgeInsets.only(top:5),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Icon(Icons.person,
                                size: 90, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              'گزارش فردی ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.only(left:20, right:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            // padding: EdgeInsets.only(top:5),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Icon(Icons.settings,
                                size: 84, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              'تنظیمات ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
            ]),
           
      
          
    );
   
  }
}