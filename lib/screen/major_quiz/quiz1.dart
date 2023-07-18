import 'package:flutter/material.dart';
import 'package:virtual_assistant/screen/major_quiz/result.dart';
import 'quiz_brain.dart';
import 'package:google_fonts/google_fonts.dart';

QuizBrain quizBrain = QuizBrain();

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<quiz> {
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const result()),
        );
      } else {
        if (userPickedAnswer == correctAnswer) {
          quizBrain.getAnswerValue();
        }
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(children: [
          Row(
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: const Color(0xff7195E1),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
            ),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Choose your major quiz",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7195E1)),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color(0xff7195E1),
            height: 20,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              "DO NOT WORRY ABOUT WHETHER YOU HAVE, THE SKILLS OR TRAINING TO DO AN ACTIVITY, OR HOW MUCH MONEY YOU MIGHT MAKE. SIMPLY THINK ABOUT WHETHER YOU WOULD ENJOY DOING IT OR NOT.",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xff7195E1),
              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 550,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff7195E1),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 10, right: 10, bottom: 15),
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 65, bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  }, //The user picked true.
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text('yes',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xff7195E1),
                          fontSize: 20.0,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 25, bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text('no',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff7195E1),
                        ),
                      )),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => quiz()),
                );
              })
            ]),
          ),
        ])),
      ),
    );
  }
}
