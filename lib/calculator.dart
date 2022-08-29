import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  List<String> sub = [
    'Select your Course',
    'Web Technology',
    'Database Management Systems',
    'Computer Architecture and Organisation',
    'Microprocessor and Microcontrollers',
    'Developing Soft skill and Personality'
  ];
  String selected = 'Select your Course';
  int classes = 0;
  int per = 0;
  late int tempclas;
  int fun1(int clas, int pr) {
    double x = (pr * clas) / 100;
    return x.toInt();
  }

  Future<dynamic> fun2(String sel, int clas, int inp) {
    double y = (inp / clas) * 100;
    if (sel == 'Select your Course') {
      return showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: Padding(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Text("Choose valid Course")),
              ));
    } else {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Padding(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Text("Final Percentage: " + y.toStringAsFixed(2))),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFECEDEF),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Row(
                children: [
                  Flexible(
                    child: IconButton(
                        iconSize: 30,
                        color: Colors.pink,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                  ),
                  const Text(
                    "Attendance Calculator",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Material(
                shadowColor: Colors.black,
                elevation: 10,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: DropdownButton<String>(
                        value: selected,
                        items: sub
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                  ),
                                ))
                            .toList(),
                        onChanged: (item) => setState(
                          () => selected = item!,
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "Total Classes Till Date: 0",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Center(
                        child: Text(
                          "Classes Attended Till Date: 0",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "Classes Remaining:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              classes.toString(),
                              style: const TextStyle(
                                  color: Colors.pink, fontSize: 17),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "More Classes",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Slider(
                            activeColor: Colors.pink,
                            min: 0.00,
                            max: 100.00,
                            value: classes.toDouble(),
                            onChanged: (value) {
                              setState(() => classes = value.toInt());
                            }),
                      ),
                      const SizedBox(height: 15),
                      const Center(
                        child: Text(
                          "Final Percentage:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          "$per%",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Slider(
                            activeColor: Colors.pink,
                            min: 0.00,
                            max: 100.00,
                            value: per.toDouble(),
                            onChanged: (value) {
                              setState(() => per = value.toInt());
                            }),
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Material(
                            shadowColor: Colors.purple,
                            color: Colors.pink,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 30, top: 20, bottom: 20),
                              child: Text(
                                "Attend  ${fun1(classes, per)} of $classes Remaining Classes to maintain $per.00 and above",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 20, bottom: 10),
                          child: Material(
                            shadowColor: Colors.purple,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Classes To Attend:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60, right: 60),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(
                                            () => tempclas = int.parse(value));
                                      },
                                    )),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    fun2(selected, classes, tempclas);
                                  },
                                  child: const Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    shadowColor: Colors.purple,
                                    elevation: 10,
                                    color: Colors.pink,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 70,
                                          right: 70,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Calculate",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
