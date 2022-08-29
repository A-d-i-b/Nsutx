import 'package:flutter/material.dart';
import 'package:nsutx/notific.dart';
import 'package:nsutx/profile.dart';
import 'package:nsutx/timetable.dart';
import 'package:nsutx/todo/screens/todo_screens.dart';
import 'Attendance.dart';

class Dra extends StatefulWidget {
  @override
  State<Dra> createState() => _DraState();
}

class _DraState extends State<Dra> {
  Widget cart(String name, dynamic tap) {
    return InkWell(
      onTap: tap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        elevation: 5,
        color: Colors.pinkAccent,
        child: Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10)),
              color: Colors.white,
            ),
            height: 50,
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Color(0xFFFD0D9E5),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('images/pp-min.jpeg')),
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Adib Ahmed Siddiqui",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "2021UCI6526",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            cart("Profile", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            }),
            cart("Attendance", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Attendance()));
            }),
            cart("Time Table", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Time()));
            }),
            cart("To do", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TaskScreen()));
            }),
            cart("Notice", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Notific()));
            }),
            cart("Syllabus", null),
            cart("Previous Year Paper", null),
            cart("Courses", null),
            cart("Results", null),
            cart("Societies", null),
            cart("Events", null),
            cart("Faculty Time Table", null),
            cart("About Us", null),
            cart("FAQs", null),
            Center(
              child: Card(
                  color: Colors.transparent,
                  elevation: 5,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 80,
                    child: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
