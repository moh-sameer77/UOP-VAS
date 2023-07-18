import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/model/containers.dart';
import 'package:virtual_assistant/screen/cs_plan/fourh_year.dart';

class ThirdYEar extends StatefulWidget {
  const ThirdYEar({super.key});

  @override
  State<ThirdYEar> createState() => _ThirdYEarState();
}

class _ThirdYEarState extends State<ThirdYEar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 210,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff7195E1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios_new),
                                  color: const Color(0xffFFFFFF),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  "Third year plan",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "  Petra University\n Faculty of : Information Technology Suggsted Plan For a Bachelor Degree in :  ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 19, color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              " Computer Science ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 15),
                        child: SizedBox(
                            height: 590,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    semestar("semster one"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    coursered(" Numerical Analysis (1)"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    coursegray("Internet Programming "),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    coursegray(" Computation Theory "),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    coursegray("Algorithms Design & Analysis"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    coursegray(" System Analysis & Design"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    courseGreen(
                                        "  Leadership and social responsibility")
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    semestar("semster Two"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    coursegray(" Modern Programming Language "),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    coursegray(" Computer Architecture"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    coursegray(" Software Engineering "),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    coursegray("Programming Language(1)"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    coursegray(" Artificial Intelligence "),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    courseGreen(" Department Elective(1) "),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    courseGreen(" General Elective(1)")
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            )),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 120.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Fourthyear()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff7195E1)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(27))),
                              ),
                              child: Text(
                                "Next year",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
