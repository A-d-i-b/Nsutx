import 'package:flutter/material.dart';
import 'package:nsutx/home2.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Time extends StatefulWidget {
  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String g = "Mon";
  String fullname = "Monday";
  Widget fun1(String name, String c, String full) {
    return InkWell(
      onTap: () {
        setState(() {
          g = c;
          fullname = full;
        });
      },
      child: Card(
        color: g == name ? Colors.pink : Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(padding: EdgeInsets.all(10), child: Text(name)),
      ),
    );
  }

  Widget timeline(String name, String code, String time, bool st, bool en) {
    return TimelineTile(
      afterLineStyle: LineStyle(color: Colors.black),
      beforeLineStyle: LineStyle(color: Colors.black),
      alignment: TimelineAlign.start,
      isFirst: st,
      isLast: en,
      endChild: Container(
          child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(code),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(time),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ))),
      indicatorStyle: const IndicatorStyle(
        color: Colors.pink,
        padding: EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: ListView(children: [
          Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.pink, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home2()),
                  );
                }),
            const SizedBox(
              width: 50,
            ),
            const Text(
              "Time Table",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            children: [
              const Spacer(),
              fun1("Mon", "Mon", "Monday"),
              const Spacer(),
              fun1("Tue", "Tue", "Tuesday"),
              const Spacer(),
              fun1("Wed", "Wed", "Wednesday"),
              const Spacer(),
              fun1("Thu", "Thu", "Thursday"),
              const Spacer(),
              fun1("Fri", "Fri", "Friday"),
              const Spacer(),
              fun1("Sat", "Sat", "Saturday"),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 30),
          Material(
            elevation: 10,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Card(
                      elevation: 10,
                      color: Colors.pink,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("My Timetable")),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Flexible(
                        child: Text("Timetable of ADIB AHMED SIDDIQUI")),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Text("Here is your time-table for $fullname")),
                    const SizedBox(height: 30),
                    timeline("Design and Analysis of Alogrithms", "CICPC06",
                        "10:00am-11:00am", true, false),
                    timeline("Web Technology", "CICPC04", "11:00am-12:00am",
                        false, false),
                    timeline("Computer Architecture and Organization",
                        "CICPC07", "12:00pm-1:00pm", false, true),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
