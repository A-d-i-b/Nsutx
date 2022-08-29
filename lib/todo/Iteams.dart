import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:nsutx/todo/modul/task_data.dart';
import 'package:intl/intl.dart';

class Iteams extends StatefulWidget {
  @override
  State<Iteams> createState() => _IteamsState();
}

class _IteamsState extends State<Iteams> {
  DateTime now = DateTime.now();
  late String time = DateFormat('dd-MMM-yyyy').format(now);
  late String n;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.pinkAccent),
              ),
              TextField(
                onChanged: (newvalue) {
                  n = newvalue;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                showCursor: true,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  DateTime? newtime = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if (newtime == null) return;
                  setState(() {
                    now = newtime;
                  });
                },
                child: SizedBox(
                  height: 60,
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.lightBlue,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            DateFormat('dd-MMM-yyyy').format(now),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Taskdata>(context, listen: false)
                      .addtitle(n, DateFormat('dd-MMM-yyyy').format(now));
                  Navigator.pop(context);
                },
                child: Text('ADD'),
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    primary: Colors.pinkAccent,
                    shadowColor: Colors.blueAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
