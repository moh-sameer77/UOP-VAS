import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/api_pdf/reader_screen.dart';
import 'package:virtual_assistant/model/box.dart';
import 'package:virtual_assistant/model/docment.dart';

import 'api_pdf/downloading_dialog.dart';

class StudentModels extends StatefulWidget {
  final String txt;

  const StudentModels(this.txt, {Key? key}) : super(key: key);

  @override
  State<StudentModels> createState() => _StudentModelsState();
}

class _StudentModelsState extends State<StudentModels> {
  List<Box> itemList = [];

  fillList() {
    if (widget.txt.trim() == "Registration\n Department Forms") {
      itemList = [
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document(
                "assets/test (2).pdf",
                " Requisition of the equivalency of an alternative substance",
                0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document("assets/Download PDF.pdf", "docTitle", 0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document("assets/Download PDF.pdf", "docTitle", 0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document("assets/Download PDF.pdf", "docTitle", 0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document(
                "assets/test (2).pdf",
                " Requisition of the equivalency of an alternative substance",
                0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document("assets/Download PDF.pdf", "docTitle", 0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document("assets/Download PDF.pdf", "docTitle", 0)),
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document("assets/Download PDF.pdf", "docTitle", 0))
      ];
    } else if (widget.txt == "         Admission \nDepartment Forms ") {
      itemList = [];
    } else if (widget.txt == " Student Models ") {
      itemList = [
        Box(
            " Requisition of the equivalency\n  of an alternative substance ",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/1- Requisition of the equivalency of an alternative substance.pdf",
                "1- Requisition of the equivalency of an alternative substance",
                0)),
        Box(
            " Requirement for the equivalence\n of an equivalent substance ",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/2- Requirement for the equivalence of an equivalent substance(1).pdf",
                "2- Requirement for the equivalence of an equivalent substance.pdf",
                0)),
        Box(
            " Request to review the\n equivalency of materials ",
            const Color(0xff7195E1),
            Document("assets/vs.pdf",
                "3- Request to review the equivalency of materials", 0)),
        Box(
            " Equation of subjects\n from outside the university ",
            const Color(0xff7195E1),
            Document(
                "asset/Student Models/4- Equation of subjects from outside the university.pdf",
                "4- Equation of subjects from outside the university",
                0)),
        Box(
            " Request to study subjects\n outside the university",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/5- Request to study subjects outside the university(1).pdf",
                "5- Request to study subjects outside the university",
                0)),
        Box(
            " Completion Mark Form ",
            const Color(0xff7195E1),
            Document("assets/Student Models/6- Completion Mark Form.pdf",
                "6- Completion Mark Form", 0)),
        Box(" Denial form ", const Color(0xff7195E1),
            Document("assets/7- Denial form.pdf", "7- Denial form", 0)),
        Box(
            " Request to review the final\n mark ",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/8- Request to review the final mark(1).pdf",
                "8- Request to review the final mark",
                0)),
        Box(
            " Request form for postponing\n final exams ",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/9- Request form for postponing final exams.pdf",
                "9- Request form for postponing final exams",
                0)),
        Box(
            " Application form for transferring\n from one specialty to another",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/10- Application form for transferring from one specialty to another(1).pdf",
                "10- Application form for transferring from one specialty to another",
                0)),
        Box(
            " Graduation application ",
            const Color(0xff7195E1),
            Document("assets/Student Models/11- Graduation application.pdf",
                "11- Graduation application", 0)),
        Box(
            " Disclaimer for graduates ",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/12- Disclaimer for graduates(1).pdf",
                "12- Disclaimer for graduates",
                0)),
        Box(
            " Summon ",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/13- Summon.pdf", "13- Summon.pdf", 0)),
        Box(
            " WARNING",
            const Color(0xff7195E1),
            Document("assets/Student Models/14- Absence of lectures.pdf",
                "14- Absence of lectures", 0)),
        Box(
            " Absence of lectures",
            const Color(0xff7195E1),
            Document(
                "assets/Student Models/15- Warning.pdf", "15- Warning", 0)),
        Box(
            " Average Percentage",
            const Color(0xff7195E1),
            Document("assets/Student Models/16. Average Percentage.pdf",
                "16. Average Percentage.pdf", 0))
      ];
    }
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    // debugShowCheckedModeBanner:
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
                        padding: const EdgeInsets.only(right: 200.0),
                        child: Image.asset("assets/untitled (8).png"),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0, top: 80),
                        child: Text(
                          widget.txt,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff7195E1))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 540,
                child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return category(context, itemList[index]);
                  },
                ),
              ),
              /* Catgeroy(
                  context,
                  Box(
                      " Requisition of the equivalency\n  of an alternative substance ",
                      const Color(0xff7195E1),
                      Document("assets/test (2).pdf", "docTitle", 0)))*/
            ],
          ),
        ),
      ),
    );
  }

  InkWell category(BuildContext context, Box item) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff7195E1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  width: 341,
                  height: 400,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            " Click button below, Go to right-bottom corner,\n Click Open Script ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF))),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReaderScreen(doc: item.doc)));
                            },
                            child: Container(
                              width: 240,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Image.asset("assets/untitled (7).png"),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Export Selected To PDF",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff7195E1))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Select multiple frames you want to export,\nClick Play button on the plugin",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffffffff))),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      DownloadingDialog(item.doc));
                            },
                            child: Container(
                              width: 240,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Icon(
                                    Icons.file_download,
                                    color: Color(0xff7195E1),
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Download Selected PDF",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff7195E1))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))));
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 58,
            width: 340,
            decoration: BoxDecoration(
                color: item.background,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                item.title,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;

  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.2587795, size.height * 0.8153906);
    path_0.cubicTo(
        size.width * -0.2281390,
        size.height * 0.4283312,
        size.width * -0.1360169,
        size.height * 0.07289156,
        size.width * 0.001511149,
        size.height * -0.1889055);
    path_0.cubicTo(
        size.width * 0.1390392,
        size.height * -0.4507023,
        size.width * 0.3132410,
        size.height * -0.6022320,
        size.width * 0.4937179,
        size.height * -0.6170531);
    path_0.cubicTo(
        size.width * 0.6741923,
        size.height * -0.6318742,
        size.width * 0.8494846,
        size.height * -0.5090445,
        size.width * 0.9890026,
        size.height * -0.2699992);
    path_0.cubicTo(
        size.width * 1.128518,
        size.height * -0.03095359,
        size.width * 1.223403,
        size.height * 0.3091289,
        size.width * 1.257097,
        size.height * 0.6909039);
    path_0.lineTo(size.width * 0.8797231, size.height * 0.8701406);
    path_0.cubicTo(
        size.width * 0.8628308,
        size.height * 0.6787477,
        size.width * 0.8152641,
        size.height * 0.5082547,
        size.width * 0.7453205,
        size.height * 0.3884141);
    path_0.cubicTo(
        size.width * 0.6753744,
        size.height * 0.2685742,
        size.width * 0.5874974,
        size.height * 0.2069969,
        size.width * 0.4970205,
        size.height * 0.2144266);
    path_0.cubicTo(
        size.width * 0.4065410,
        size.height * 0.2218570,
        size.width * 0.3192103,
        size.height * 0.2978227,
        size.width * 0.2502631,
        size.height * 0.4290687);
    path_0.cubicTo(
        size.width * 0.1813164,
        size.height * 0.5603148,
        size.width * 0.1351331,
        size.height * 0.7385070,
        size.width * 0.1197721,
        size.height * 0.9325469);
    path_0.lineTo(size.width * -0.2587795, size.height * 0.8153906);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
