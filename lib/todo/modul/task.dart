class Task {
  String name;
  bool? isdone;
  String ftime;
  Task({required this.name, this.isdone = false, required this.ftime});
  void toggle() {
    if (isdone == false) {
      isdone = true;
    } else if (isdone == true) {
      isdone = false;
    }
  }
}
