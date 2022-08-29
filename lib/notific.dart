import 'package:flutter/material.dart';
import 'package:nsutx/home2.dart';
import 'package:intl/intl.dart';

class Notific extends StatefulWidget {
  @override
  State<Notific> createState() => _NotificState();
}

class _NotificState extends State<Notific> {
  DateTime now = DateTime.now();
  late String time = DateFormat('dd-MMMM-yyyy').format(now);
  late String time2 = DateFormat('EEEE').format(now);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: ListView(children: [
          Column(children: [
            Row(children: [
              IconButton(
                  icon:
                      Icon(Icons.arrow_back_ios, color: Colors.pink, size: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home2()),
                    );
                  }),
              const SizedBox(
                width: 50,
              ),
              const Flexible(
                child: Text(
                  "NSUT Notices and Circular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Text("${time},${time2}"),
            SizedBox(
              height: 20,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                    elevation: 60,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(time),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  right: 0,
                  left: 280,
                  top: -20,
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("images/NSUTlogo.png")),
                ),
              ],
            ),
          ]),
        ]),
      ),
    );
  }
}
