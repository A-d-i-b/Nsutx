import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nsutx/home2.dart';
import 'package:nsutx/todo/Iteams.dart';
import 'package:nsutx/todo/listview.dart';

import 'package:provider/provider.dart';
import 'package:nsutx/todo/modul/task_data.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Iteams()));
        },
      ),
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home2()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  content: const SizedBox(
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        "Long Press The items to delete",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueGrey),
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("images/todoimg.jpeg"),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'TODO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w700),
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${Provider.of<Taskdata>(context, listen: true).tasks.length} tasks",
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Listview(),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
