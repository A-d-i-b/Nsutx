import 'package:flutter/material.dart';
import 'package:nsutx/todo/listtile.dart';

import 'package:provider/provider.dart';
import 'package:nsutx/todo/modul/task_data.dart';

class Listview extends StatefulWidget {
  @override
  State<Listview> createState() => ListviewState();
}

class ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<Taskdata>(context, listen: true).tasks.length,
        itemBuilder: (context, index) {
          return Listtile(
            longpress: () {
              Provider.of<Taskdata>(context, listen: false).delete(
                  Provider.of<Taskdata>(context, listen: false).tasks[index]);
            },
            checked: Provider.of<Taskdata>(context, listen: true)
                .tasks[index]
                .isdone,
            tasktitle:
                Provider.of<Taskdata>(context, listen: true).tasks[index].name,
            toggle: (newvalue) {
              setState(() {
                Provider.of<Taskdata>(context, listen: false)
                    .tasks[index]
                    .toggle();
              });
            },
            time:
                Provider.of<Taskdata>(context, listen: true).tasks[index].ftime,
          );
        });
  }
}
