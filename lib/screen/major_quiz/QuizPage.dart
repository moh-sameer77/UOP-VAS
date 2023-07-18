import 'package:flutter/material.dart';
import 'package:virtual_assistant/screen/major_quiz/quiz1.dart';

import 'package:google_fonts/google_fonts.dart';
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 290.0),
                        child: Image.asset("assets/topCircle.png"),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),
                              Image.asset(
                                "assets/takeQuizPic.png",
                                width: 357,
                                height: 407,
                              ),
                              // ignore: prefer_const_constructors
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                right: 40,
                              )),
                              Text(
                                "Are you confused and you \ndon’t know what you would \nlike to major in? ",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff7195E1))),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                right: 40,
                              )),
                              Text("don’t worry we are going to \nhelp.",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 22,
                                          color: Color.fromARGB(
                                              255, 135, 148, 175))))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 20, top: 50),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => quiz()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff7195E1)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 120, vertical: 15)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27))),
                                  ),
                                  child: Text(
                                    "Take Quiz",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
