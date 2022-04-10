import 'package:flutter/material.dart';

class PersonRprtTile extends StatelessWidget {
  final String month;
  final String date;
  final String day;
  final String state;
  PersonRprtTile({
    @required this.date,
    @required this.day,
    @required this.state,
    @required this.month,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
          title: Text(date),
          subtitle: Text(day),
          trailing: Text(state, style: TextStyle(fontSize: 16))),
    );
  }
}
