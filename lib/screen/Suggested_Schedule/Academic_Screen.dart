import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/Suggested_Schedule/suggested_schedule.dart';

import 'AcadmicPlan.dart';
import '../../../model/AcademicWidget.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({Key? key}) : super(key: key);

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  final AcademicWidget KK = AcademicWidget("nameOfWidget", Colors.white);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/untitled (6).png",
                  width: 433,
                  height: 280,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: Text("Schedule",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff000000)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Center(
                    child: Text("Select your completed courses",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7195E1)))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: academicWidgetList().nList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      yearChose(academicWidgetList().nList[index], context),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            button()
          ],
        ),
      )),
    );
  }

      InkWell button() {
    return InkWell(
      onTap: () async {
         Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Suggested_Schedule()));
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

  InkWell yearChose(AcademicWidget aa, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AcadmicPlan(aa.nameOfWidget)),
      ),
      child: Container(
          height: 59,
          width: 350,
          decoration: const BoxDecoration(
              color: Color(0xff7195E1),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text(aa.nameOfWidget,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
          )),
    );
  }
}
