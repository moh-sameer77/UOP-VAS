import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/student_models.dart';


//Test
class Forms extends StatelessWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7195E1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: const Color(0xffFFFFFF),
                  ),
                ],
              ),
              Image.asset("assets/untitled (5).png"),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                height: 347.9,
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Academy Forms ",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color(0xff7195E1),
                              fontWeight: FontWeight.bold),
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    studentModels(context, " Student Models "),
                    const SizedBox(
                      height: 20,
                    ),
                    studentModels(
                        context, "         Admission \nDepartment Forms "),
                    const SizedBox(
                      height: 20,
                    ),
                    studentModels(
                        context, "        Registration\n Department Forms "),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell studentModels(BuildContext context, String txt) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentModels(txt)),
        );
      },
      child: Container(
        width: 239,
        height: 47,
        decoration: const BoxDecoration(
            color: Color(0xff7195E1),
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            )),
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Image.asset("assets/untitled (6).png"),
            const SizedBox(
              width: 25,
            ),
            Center(
              child: Text(txt,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                      fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }
}
