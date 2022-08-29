import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget cart(String name, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 5,
      shadowColor: Colors.purple,
      color: Colors.pinkAccent,
      child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(left: 10),
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      name,
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
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
                ],
              ),
              Center(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/pp-min.jpeg')),
                      borderRadius: BorderRadius.circular(70),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Container(
                  child: ListView(
                    children: [
                      cart("ADIB AHMED SIDDIQUI", "Student Name"),
                      cart("2021UCI6526", "Student ID"),
                      cart("06-03-2003", "DOB"),
                      cart("COMPUTER SCIENCE AND ENGINEERING", "Branch Name"),
                      cart("1", "Section"),
                      cart("MALE", "Gender"),
                      cart(
                          "COMPUTER SCIENCE AND ENGINEERING(INTERNET OF THINGS)",
                          "Specialization"),
                      cart("Admission", "Admission"),
                      cart("B.Tech", "Degree"),
                      cart("FULL TIME", "FT/PT"),
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
