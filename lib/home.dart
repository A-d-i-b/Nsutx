import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nsutx/Attendance.dart';
import 'package:nsutx/classesatend.dart';
import 'package:nsutx/profile.dart';
import 'package:nsutx/timetable.dart';
import 'package:nsutx/todo/screens/todo_screens.dart';
import 'drawer.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final now = DateTime.now();
  late String time = DateFormat('dd-MMM-yyyy').format(now);
  late String time2 = DateFormat('EEEE').format(now);
  double progressvalue = 80.00;

  Widget fun1(String code, String name, double val, dynamic fun) {
    return InkWell(
      onTap: fun,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 80,
          width: 80,
          child: SfRadialGauge(
            enableLoadingAnimation: true,
            animationDuration: 1000,
            axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.12,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.grey.shade300,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: val,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.12,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: val < 75 ? Colors.red : Colors.green,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        angle: 90,
                        widget: Text(
                          "${val.toStringAsFixed(1)}%",
                          style: const TextStyle(fontSize: 15),
                        ))
                  ])
            ],
          ),
        ),
        Text(
          code,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
            alignment: Alignment.center,
            width: 120,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
            )),
      ]),
    );
  }

  late List card = [
    fun1("CICPC04", "Web Technology", 33.3, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Attend(name: "Web Technology")));
    }),
    fun1("CICOC05", "Database Management Systems", 78.0, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Attend(name: "Database Management Systems")));
    }),
    fun1("CICPC06", "Design and Analysis of...", 80, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Attend(name: "Design and Analysis of Algorithms")));
    }),
    fun1("CICP07", "Computer Architecture and Organisation", 40.7, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Attend(name: "Computer Architecture and Organisation")));
    }),
    fun1("CIEPC08", "Microprocessor and Microcontrollers", 89.8, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Attend(name: "Microprocessor and Microcontrollers")));
    }),
    fun1("FENH001", "Developing Soft skill and Personality", 70, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Attend(name: "Developing Soft skill and Personality")));
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      drawer: Dra(),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("images/nsut.jpeg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                ),
                Positioned(
                  right: -1,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    content: SizedBox(
                                      height: 150,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Center(
                                              child: Text(
                                                "Your Data is Safe",
                                                style: TextStyle(
                                                    color: Colors.pink,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Center(
                                              child: Text(
                                                "NSUTx is using IMS APIs to diplay a student's information All your data is completely secured.",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            )
                                          ]),
                                    )),
                              ));
                    },
                    icon: const Icon(Icons.info_outline,
                        color: Colors.black, size: 30),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage("images/pp-min.jpeg")),
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -38,
                    left: 45,
                    child: Text(
                      time2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Positioned(
                    bottom: -60,
                    left: 30,
                    right: 0,
                    child: Text(
                      time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 15),
                    )),
                const Positioned(
                    bottom: -50,
                    left: 0,
                    right: -220,
                    child: Center(
                      child: Text(
                        "Semester- 3",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 80),
            SizedBox(
              height: 150,
              child: Material(
                color: Colors.white,
                elevation: 5,
                shadowColor: Colors.black,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListView.builder(
                    itemCount: card.length,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => card[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Profile"),
                ]),
                const SizedBox(
                  width: 30,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attendance()));
                        },
                        icon: const Icon(
                          Icons.how_to_reg,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Attendance"),
                ]),
                const SizedBox(
                  width: 30,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskScreen()));
                        },
                        icon: const Icon(
                          Icons.checklist,
                          color: Colors.black,
                        )),
                  ),
                  const Text("ToDo"),
                ]),
                const SizedBox(
                  width: 30,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Time()));
                        },
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Time Table"),
                ])
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chrome_reader_mode,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Syllabus"),
                ]),
                const SizedBox(
                  width: 30,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.copy_rounded,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(width: 80, child: Text("Previous Year Paper")),
                ]),
                const SizedBox(
                  width: 20,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bar_chart,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Result"),
                ]),
                const SizedBox(
                  width: 30,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.event_note_outlined,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Course"),
                ])
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.style,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Societies"),
                ]),
                const SizedBox(
                  width: 30,
                ),
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.pink,
                          width: 1,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.event_available_rounded,
                          color: Colors.black,
                        )),
                  ),
                  const Text("Events"),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
