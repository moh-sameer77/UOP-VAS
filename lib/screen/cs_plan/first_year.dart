import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/model/containers.dart';
import 'package:virtual_assistant/screen/cs_plan/second_year.dart';

class Firstyear extends StatefulWidget {
  const Firstyear({super.key});

  @override
  State<Firstyear> createState() => _FirstyearState();
}

class _FirstyearState extends State<Firstyear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: [
            Stack(
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
                                width: 56,
                              ),
                              Text(
                                "First year plan ",
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
                            height: 5,
                          ),
                          Text(
                            "  Petra University\n Faculty of : Information Technology Suggsted Plan For a Bachelor Degree in :  ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 5,
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
                          height: 500,
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
                                  coursered("Calculas(1)"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursegray(
                                      "Information Technology Fundamentals "),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  courseGreen("National Education"),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  coursegray(
                                      "Computer Skills (Compulsory for IT Majors)"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  courseGreen(" Life Skills"),
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
                                  coursered(" Discrete Mathematics(1)"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursered(" General Physics Lab"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursered(" General Physics for IT"),
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
                                  coursegray(
                                      " Introduction to Data Communication & Networking "),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  courseGreen(
                                      " Communication Skills in English (1) ")
                                ],
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
                                          const SecondYear()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff7195E1)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            child: Text(
                              "Next year",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
