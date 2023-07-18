// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/model/Course.dart';
import 'package:virtual_assistant/model/PassedCourse.dart';
import 'package:virtual_assistant/screen/dashboard/dashboard.dart';

import '../../../action/student/student_action.dart';
import '../../../model/plans.dart';

class Suggested_Schedule extends StatefulWidget {
  Suggested_Schedule({Key? key}) : super(key: key);
  List<PlansCatgeory> itemList = [];
  




  @override
  State<Suggested_Schedule> createState() => _Suggested_ScheduleState();
}

class _Suggested_ScheduleState extends State<Suggested_Schedule> {
bool isListFilled = false;
  
  @override
  void initState() {

  super.initState();
  setFirstName();
  context.read<StudentAction>().suggestSchedule(context);
  

  }

fillList() {
    if (!isListFilled) {
        for (Course course in context.watch<StudentAction>().suggestedSchedule) {
          widget.itemList.add(PlansCatgeory(course.name,const Color(0xff7195E1), course.id));
        }
      }
      isListFilled = true;
    }
  

  String firstName = "";

  final PlansCatgeory plansCatgeory = PlansCatgeory.init();





  @override
  Widget build(BuildContext context) {

    fillList();
    return Scaffold(
      
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff7195E1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 340.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                        ),
                      ),
                      Text("Suggested Courses for $firstName",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Computer Science ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: widget.itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      materials(context, widget.itemList[index]),
                      const SizedBox(
                        width: 10,
                      ),
                      
                     
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            button(),
            
            
          ],
        ),
      ),
    );
  }

    setFirstName() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.read(key: "firstName").then((value) => firstName = value!);
  }

      InkWell button() {
    return InkWell(
      onTap: () async {
         Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Dashboard()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: const BoxDecoration(
            color: Color(0xff7195E1),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            "To the dashboard",
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


  InkWell materials(BuildContext context, PlansCatgeory materials) {
    return InkWell(
        onTap: () => {
              
            },
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                      color: materials.color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text(materials.name,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
