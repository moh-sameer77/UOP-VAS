import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/major_quiz/quiz1.dart';
import 'package:virtual_assistant/student_models.dart';

class TakeQuiz extends StatelessWidget {
  const TakeQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xff7195E1),
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ],
          ),
          Image.asset(
            "assets/takeQuizPic.png",
            height: 317,
            width: 367,
          ),
          Center(
            child: Text(
              " Are you confused and you\n don’t know what you would\n like to major in?  ",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 7)
                  ],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff7195E1))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              " don’t worry we are going to help. ",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 7)
                  ],
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff9399A6))),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => quiz()),
            ),
            child: Center(
              child: Container(
                height: 50,
                width: 368,
                decoration: const BoxDecoration(
                    color: Color(0xff7195E1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Text(
                    " Take Quiz ",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: const Color(0xffffffff),
                            shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(0, 1),
                              blurRadius: 3)
                        ])),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
