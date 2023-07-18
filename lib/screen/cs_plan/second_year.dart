import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/model/containers.dart';
import 'package:virtual_assistant/screen/cs_plan/third_year.dart';

class SecondYear extends StatelessWidget {
  const SecondYear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                                width: 55,
                              ),
                              Text(
                                "Second year plan ",
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
                          height: 600,
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
                                  coursered("Principles of Statistcs"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursered("Linear Algebra (1) "),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursegray("Programming Language(2) "),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  coursegray(" Comunication Skills for IT"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursegray(" Computer Logic Design"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  courseGreen(
                                      " Enterprenureship and Innovation")
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
                                  coursegray("  Visual Programming"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursegray("  Data Structure"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  coursegray(" Database (1) "),
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
                                      "  Information & Network Security "),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  courseGreen(
                                      "Communication Skills in Arabic (1) ")
                                ],
                              ),
                              Row(
                                children: [
                                  courseGreen("meeran "),
                                  coursered("franch")
                                ],
                              )
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
                                      builder: (context) => const ThirdYEar()));
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
