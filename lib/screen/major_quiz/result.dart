import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:virtual_assistant/screen/major_quiz/quiz1.dart';
import 'package:virtual_assistant/screen/major_quiz/quiz_brain.dart';

class result extends StatefulWidget {
  const result({super.key});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Column(children: [
              Stack(
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        height: 260,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff7195E1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "RESULTS ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                              height: 20,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                            ),
                            RIASEC(child: "Realistc "),
                            RIASEC(child: "Investigative  "),
                            RIASEC(child: "Artistic "),
                            RIASEC(child: "Social "),
                            RIASEC(child: "Enterprising "),
                            RIASEC(child: "Conventional "),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 270),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                color: const Color(0xff7195E1),
                                width: 2,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              quizBrain.MaxNumber(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff7195E1)),
                              ),
                            )),
                          ),
                        ),
                        Center(
                          child: Text(
                            "BASED ON YOUR ANSWERS BELOW \nARE THE BEST MAJORS FOR YOU",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff7195E1)),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: const BoxDecoration(
                                color: Color(0xff7195E1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: ListView.builder(
                                itemCount: quizBrain.code().length,
                                itemBuilder: (context, index) => ListTile(
                                  title: Text(
                                    quizBrain.code()[index],
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 650.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  quiz()), //////// Dashboard();
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
                                "done",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 17, color: Colors.white)),
                              ),
                              const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ])
          ],
        ),
      )),
    );
  }
}

class RIASEC extends StatelessWidget {
  final String child;
  const RIASEC({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Text(
        child,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
