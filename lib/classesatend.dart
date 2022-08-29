import 'dart:ui';

import 'package:flutter/material.dart';

class Attend extends StatefulWidget {
  String name;
  Attend({required this.name});
  @override
  State<Attend> createState() => _AttendState(this.name);
}

class _AttendState extends State<Attend> {
  String name;
  _AttendState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFECEDEF),
        body: Column(children: [
          SafeArea(
            child: Container(
              color: Color(0xFFFECEDEF),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: IconButton(
                            iconSize: 30,
                            color: Colors.pink,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        content: SizedBox(
                                          height: 400,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Center(
                                                  child: Text(
                                                    "Notations",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.pink,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                    color: Colors.black,
                                                    thickness: 2),
                                                Center(
                                                  child: Text(
                                                    "* CR - Class Rescheduled\n\n* CS - Class suspended\n\t\t\tOfficially\n\n* GH - Gazetted Holiday\n\n* MB - Mass Bunk\n\n* MS - Mid Sem Exam\n\n*NA -Timetable Not Alloted\n\n* NT - Class Not Taken\n\n* OD - Teacher on Official duty\n\n* TL - Teacher on Leave",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade900,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ]),
                                        )),
                                  ));
                        },
                        icon: const Icon(Icons.info_outline,
                            color: Colors.pink, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFFECEDEF),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFFF70CF97),
                            borderRadius: BorderRadius.circular(18)),
                        child: const Text(
                          "0 of 0 classes attended",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Container(
                        child: ListView(
                          padding: EdgeInsets.only(left: 10, right: 10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
