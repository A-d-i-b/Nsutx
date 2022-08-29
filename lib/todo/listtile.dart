import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Listtile extends StatelessWidget {
  final bool? checked;
  final String tasktitle;
  final Function(bool?) toggle;
  final VoidCallback longpress;
  final String time;
  Listtile(
      {this.checked,
      required this.tasktitle,
      required this.toggle,
      required this.longpress,
      required this.time});

  TextDecoration fun1() {
    if (checked == true) {
      return TextDecoration.lineThrough;
    }
    return TextDecoration.none;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpress,
      leading: Text(
        time,
        style: TextStyle(fontSize: 15),
      ),
      title: Text(
        tasktitle,
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: Colors.black,
          decoration: fun1(),
        ),
      ),
      trailing: Checkbox(
        value: checked,
        onChanged: toggle,
      ),
    );
  }
}
