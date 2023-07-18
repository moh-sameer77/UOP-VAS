import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/admin/studentlist.dart';
import 'admin_dashboard.dart';
import 'admin_dashboard.dart';

Viewinformation info = Viewinformation();

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 230,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff7195E1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(120),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    alignment: Alignment.topLeft,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios_new),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ],
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/untitled (3).png",
                                  height: 134,
                                  width: 120,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Student name : ",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100, top: 70),
                        child: Column(
                          children: [
                            Text(
                              "Student Name: ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color:  Color(0xff7195E1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Student GPS: ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff7195E1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Student Email: ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff7195E1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Student Birth: ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff7195E1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Student Faculty: ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff7195E1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Student Major: ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff7195E1),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminDashboard()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 200.0),
                                child: Container(
                                  // slider
                                  width: 90,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff7195E1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      )),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Done",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.white)),
                                      ),
                                      Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );

  }
}
