import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/model/EnrolledStudent.dart';

import '../../action/user/user_action.dart';
import 'Academic_Screen.dart';

class plan_year extends StatefulWidget {
  const plan_year({super.key});

  @override
  State<plan_year> createState() => _plan_yearState();
}

class _plan_yearState extends State<plan_year> {
  String? academicPlan;
  double? academicyear;
  List<String> majors = [
    'computer science',
    'Software Engineering',
    'Virtual augmented reality',
    'Informatioin Science',
    'DS & AI',
  ];
  List<String> years = [
    'First year',
    'second year',
    'Third year',
    'Fourth year',
    'Fifth year and more',
  ];
  String? selectitem1 = "Informatioin Science";
  String? selectitem2 = "First year";
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
                      height: 150,
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
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            " Enter your Data to continue...",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 15, right: 15),
                      child: Container(
                        height: 700,
                        width: double.infinity,
                        child: Column(
                          children: [
                            newMethod(),
                            newMethod1(),
                            button(),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }

    InkWell button() {
 
   EnrolledStudent enrolledStudent = EnrolledStudent.init();
   enrolledStudent.academicPlan = academicPlan?.trim();
   enrolledStudent.academicYear = academicyear;

    return InkWell(
      onTap: () async {
        await context.read<UserAction>().registerEnrolled(context, enrolledStudent);
         Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AcademicScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: const BoxDecoration(
            color: Color(0xff7195E1),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            "Next",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff))),
          ),
        ),
      ),
    );
  }

  AlertDialog newMethod() {
    return AlertDialog(
      title: Text(
        "choose your major",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff7195E1))),
      ),
      content: Container(
        height: 100,
        width: 50,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectitem1,
              items: majors
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Color(0xff7195E1))),
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  
               
                if (item == "computer science") {
                  academicPlan = "1";
                } else if (item == "Software Engineering") {
                  academicPlan = "2";
                } else if (item == "Virtual augmented reality") {
                  academicPlan = "3";
                } else if (item == "Informatioin Science") {
                  academicPlan = "4";
                } else if (item == "Data Science & Artificial Intelligence") {
                  academicPlan = "5";
                }
                 });
              },
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog newMethod1() {
    return AlertDialog(
      title: Text(
        "choose your academic year",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff7195E1))),
      ),
      content: Container(
        height: 100,
        width: 50,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectitem2,
              items: years
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Color(0xff7195E1))),
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  
                
                if (item == "First year") {
                  academicyear = 1;
                } else if (item == "second year") {
                  academicyear = 2;
                } else if (item == "Third year") {
                  academicyear = 3;
                } else if (item == "Fourth year") {
                  academicyear = 4;
                } else if (item == "Fifth year and more") {
                  academicyear = 5;
                }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
