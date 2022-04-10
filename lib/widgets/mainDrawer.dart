import 'package:Attendece/screens/dailyListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import './drawerListTile.dart';

class MainDrawer extends StatelessWidget {
  static const routeName = "/mainDrawer";
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/image/ti.png",
                      ),
                      fit: BoxFit.fill)),
              height: 182,
              width: double.infinity,
              padding: EdgeInsets.only(top: 49, bottom: 10),
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.person, size: 34),
                      radius: 25,
                    ),
                    Text(
                      "روح الله نبوی",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                    Text("مدیر داخلی و بازاریاب",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              )),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("حاضری روزانه",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(DailyListScreen.routeName);
            },
          ),
          Divider(indent: 10, endIndent: 10, color: Colors.black26),
          SizedBox(height: 10),
          DrawerListTile(),
          Divider(indent: 10, endIndent: 10, color: Colors.black26)
        ],
      ),
    ));
  }
}
