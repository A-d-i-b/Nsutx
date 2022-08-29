import 'package:flutter/material.dart';
import 'package:nsutx/calculator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:nsutx/home2.dart';
import 'classesatend.dart';

class Attendance extends StatefulWidget {
  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  Widget temcard(String code, String name, double val) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Attend(name: name)));
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 126,
          decoration: BoxDecoration(
            color: Color(0xFFFECEDEF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 350,
                decoration: const BoxDecoration(
                    color: Color(0xFFF70CF97),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(22),
                      bottomLeft: Radius.circular(22),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        code,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),

                        // const Text(
                        //   "0.0%",
                        //   style: TextStyle(color: Colors.white),
                        // ),
                        Spacer(),
                        SizedBox(
                          height: 70,
                          width: 90,
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
                                      color:
                                          val < 75 ? Colors.red : Colors.green,
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
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  val < 75
                      ? Text(
                          "Attend more classes to enter safe Zone",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )
                      : Text(
                          "Already in safe zone,take a nap",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.white,
              height: 190,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home2()));
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Text(
                        "Attendance",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Text(
                    "Semester - 3",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Calc()));
                      },
                      child: Card(
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                        color: Colors.transparent,
                        elevation: 5,
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.pink,
                          ),
                          child: const Center(
                            child: Text(
                              "Attendance calculator",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              width: 350,
              child: ListView(
                children: [
                  temcard("CICP04", "Web Technology", 33.3),
                  const SizedBox(height: 9),
                  temcard("CICP05", "Database Management Systems", 78.0),
                  const SizedBox(height: 9),
                  temcard("CICP06", "Design and Analysis of Algorithms", 80),
                  const SizedBox(height: 9),
                  temcard(
                      "CICP07", "Computer Architecture and Organisation", 40.7),
                  const SizedBox(height: 9),
                  temcard(
                      "CICP08", "Microprocessor and Microcontrollers", 89.8),
                  const SizedBox(height: 9),
                  temcard(
                      "CICP01", "Developing Soft skill and Personality", 70),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
