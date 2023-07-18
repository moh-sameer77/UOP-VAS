// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/model/Course.dart';
import 'package:virtual_assistant/model/PassedCourse.dart';

import '../../../action/student/student_action.dart';
import '../../../model/plans.dart';

class AcadmicPlan extends StatefulWidget {
  AcadmicPlan(this.nameofWidget, {Key? key}) : super(key: key);
  String nameofWidget;
  List<PlansCatgeory> itemList = [];
  




  @override
  State<AcadmicPlan> createState() => _AcadmicPlanState();
}

class _AcadmicPlanState extends State<AcadmicPlan> {
bool isListFilled = false;
  
  @override
  void initState() {

  super.initState();
  context.read<StudentAction>().getCourses(context, 1);
  context.read<StudentAction>().getCourses(context, 2);
  context.read<StudentAction>().getCourses(context, 3);
  context.read<StudentAction>().getCourses(context, 5);
  // context.read<StudentAction>().calculateAcademicProgress(context);


  }

fillList() {
    if (!isListFilled) {
      if (widget.nameofWidget == "University Requirements") {
        for (Course course in context.watch<StudentAction>().universityReqs) {
          widget.itemList.add(PlansCatgeory(course.name,const Color(0xff5CFF5C), course.id));
        }
      }
      else if (widget.nameofWidget == "Faculty Compulsory Requirement") {
        for (Course course in context.watch<StudentAction>().facultyCompReqs) {
          widget.itemList.add(PlansCatgeory(course.name, const Color(0xff5CFF5C), course.id));
        }
      }
      else if (widget.nameofWidget == "Department Compulsory Requirements") {
        for (Course course in context.watch<StudentAction>().departmentCompReqs) {
          widget.itemList.add(PlansCatgeory(course.name, const Color(0xff5CFF5C), course.id));
        }
      }
      else if (widget.nameofWidget ==  "Department Elective Requirements ") {
        for (Course course in context.watch<StudentAction>().departmentElectives) {
          widget.itemList.add(PlansCatgeory(course.name, const Color(0xff5CFF5C), course.id));
        }
      }
      isListFilled = true;
    }
  }
    void button(int courseId, double mark) async {
    final passedCourse = PassedCourse(courseId, mark);
    await context.read<StudentAction>().addPassedCourse(context, passedCourse);
  }


  final PlansCatgeory kk = PlansCatgeory("name", Color(0xffffffff), 3);
  List<String> grades = [
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'D-',
    'F'
  ];
  String? selectitem = "A";




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
                      Text(widget.nameofWidget,
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
            
            
          ],
        ),
      ),
    );
  }

//       InkWell button() {
 


//     return InkWell(
//       onTap: () async {

//         for (int i = 0; i < widget.itemList.length; i++) {
//     if (widget.itemList[i].mark != null) {
//         PassedCourse passedCourse = PassedCourse( widget.itemList[i].courseId , widget.itemList[i].mark);
//         await context.read<StudentAction>().addPassedCourse(context, passedCourse);
//     }
// }
//           Navigator.pop(context);

//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 50,
//         decoration: const BoxDecoration(
//             color: Color(0xff7195E1),
//             borderRadius: BorderRadius.all(Radius.circular(9))),
//         child: Center(
//           child: Text(
//             "Next",
//             style: GoogleFonts.poppins(
//                 textStyle: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffffffff))),
//           ),
//         ),
//       ),
//     );
//   }

  InkWell materials(BuildContext context, PlansCatgeory materials) {
    return InkWell(
        onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Mark",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xff7195E1))),
                      ),
                      content: Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              value: selectitem,
                              items: grades
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                  color: Color(0xff7195E1))),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  if (item == "A") {
                                  materials.mark = 4.0;
                                } else if (item == "A-") {
                                  materials.mark = 3.67;
                                } else if (item == "B+") {
                                  materials.mark = 3.33;
                                } else if (item == "B") {
                                  materials.mark = 3.00;
                                } else if (item == "B-") {
                                  materials.mark = 2.67;
                                } else if (item == "C+") {
                                  materials.mark = 2.33;
                                } else if (item == "C") {
                                  materials.mark = 2.00;
                                } else if (item == "C-") {
                                  materials.mark = 1.67;
                                } else if (item == "D+") {
                                  materials.mark = 1.33;
                                } else if (item == "D") {
                                  materials.mark = 1.00;
                                } else if (item == "D-") {
                                  materials.mark = 0.67;
                                } else if (item == "F") {
                                  materials.mark = 0.00;
                                }
                                });
                                materials.color= Color.fromARGB(255, 151, 155, 151);
                                print("${materials.courseId} ${materials.mark}");
                                button(materials.courseId, materials.mark);

                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  })
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
