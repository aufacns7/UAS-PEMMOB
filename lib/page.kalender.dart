
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
State<Calender> createState() => Kalender();
}


class Kalender extends State<Calender> {

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KALENDER")),
      body: content(),
    );
  }

    Widget content(){
      return Column(
        children: [
          Container(
            child: TableCalendar(
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              focusedDay: today, 
              firstDay: DateTime.utc(2015, 11, 9), 
              lastDay: DateTime.utc(2040, 11, 9),
            ),
          )
        ],
      );
    }
  }