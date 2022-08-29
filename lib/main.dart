import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nsutx/todo/modul/task_data.dart';
import 'home2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Taskdata();
      },
      child: MaterialApp(
        home: Home2(),
      ),
    );
  }
}
