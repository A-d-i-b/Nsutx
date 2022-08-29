import 'package:flutter/material.dart';
import 'package:nsutx/todo/modul/task.dart';

class Taskdata extends ChangeNotifier {
  List<Task> tasks = [];
  late String title;
  late String time;
  void addtitle(title, time) {
    tasks.add(Task(name: title, ftime: time));
    notifyListeners();
  }

  void delete(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
