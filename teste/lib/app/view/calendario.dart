import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calendario")),
        body: Column(
          children: [
            TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2000),
                lastDay: DateTime(2030),
                calendarFormat: format,

                onFormatChanged: (CalendarFormat _format){
                  setState(() {
                    format = _format;
                  });
                },
                ),
          ],
        ));
  }
}
