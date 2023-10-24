import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/landingPage';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  //
  DateTime today = DateTime.now();
  //
  //
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ), //AppBar
      body: content(),
    ); //Scaffold
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Text("Selected Day =${today.toString().split(" ")[0]}"),
          Container(
            margin: const EdgeInsets.all(3.0),
            color: const Color.fromARGB(255, 224, 221, 26),
            child: TableCalendar(
              locale: "en_us", //Different locale can be used here
              rowHeight: 43,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ), //HeaderStyle
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today, //'today' has to be defined above but not here
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              onDaySelected: _onDaySelected,
            ), //TableCalender
          ) //Contaier
        ],
      ), //Column
    ); //Padding
  }
}
