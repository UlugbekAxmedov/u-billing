import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1E20),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                  currentDay: DateTime.now(),
                  calendarFormat: CalendarFormat.week,
                  weekendDays: const [
                    DateTime.sunday
                  ],
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(color: Color(0xFFD1D1D1), fontWeight: FontWeight.w700),
                  ),
                  headerVisible: true,
                  headerStyle: HeaderStyle(
                    leftChevronIcon: const Icon(Icons.arrow_back_ios_outlined, color: Color(0xFFD1D1D1)),
                    rightChevronIcon: const Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFFD1D1D1)),
                    titleTextFormatter: (date, locale) => DateFormat('MMMM, y').format(date),
                    formatButtonVisible: false,
                    titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFFDADADA),),
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                      _selectedDay = selectedDay;
                    });
                  },
                  lastDay: DateTime.utc(2050, 12, 31),
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(1970, 1, 1),
                  selectedDayPredicate: (day) => (day == _selectedDay),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}