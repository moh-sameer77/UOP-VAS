import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:virtual_assistant/screen/Suggested_Schedule/suggested_schedule.dart';
import 'package:virtual_assistant/screen/cs_plan/first_year.dart';
import 'package:virtual_assistant/screen/reminder/reminder.dart';
import 'package:virtual_assistant/action/student/student_action.dart';
import 'package:virtual_assistant/forms.dart';
import 'package:virtual_assistant/screen/dashboard/dashboard_buttons.dart';
import 'package:virtual_assistant/screen/dashboard/slider_widget.dart';
import 'package:virtual_assistant/screen/major_quiz/quiz1.dart';
import 'package:virtual_assistant/screen/reminder/event.dart';

import 'bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  _DashboardState() {
    AlanVoice.addButton(
        "5b6e4f96b09003034ae46d7d6a192ee62e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }
  void _handleCommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "notification":
        Navigator.pushNamed(context, '/notification');
        break;
      case "quiz":
        Navigator.pushNamed(context, '/quiz');
        break;
      case "map":
        Navigator.pushNamed(context, '/map');
        break;
      case "calendar":
        Navigator.pushNamed(context, '/calendar');
        break;
      case "plan":
        Navigator.pushNamed(context, '/plan');
        break;
      case "paperwork":
        Navigator.pushNamed(context, '/paperwork');
        break;
      case "profile":
        Navigator.pushNamed(context, '/profile');
        break;

      case "back":
        Navigator.pushNamed(context, '/dashboard');
        break;
      default:
        debugPrint("Unknown command");
    }
  }

  final _sliderCont = PageController();

  late AnimationController controller;

  String firstName = "";


  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    setFirstName();
    context.read<StudentAction>().getReminders(context);
    // context.read<StudentAction>().calculateAcademicProgress(context);

    super.initState();
  }
  

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (firstName.isEmpty) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: CircularProgressIndicator(
              value: controller.value,
            ),
          ),
        ),
      );
    } else {
      return BottomBar(
        // ignore: prefer_const_literals_to_create_immutables
        body: SafeArea(
          child: Column(children: [
            //appBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Color(0xff7195E1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.menu_sharp)
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            Container(
              // welcome
              width: 320,
              height: 100,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xfff1f5fc),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(55, 0, 0, 0),
                    spreadRadius: 1.25,
                    blurRadius: 2,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome $firstName!",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xff7195E1),
                          letterSpacing: -0.6,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      "assets/profile.png",
                      height: 100.0,
                      width: 70.0,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
              // slider
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _sliderCont,
                children: [
                  SliderWidget(
                    title: "Academic Progress",
                    content: CircularPercentIndicator(
                      radius: 65,
                      lineWidth: 11,
                      backgroundColor: Colors.white,
                      progressColor: const Color(0xff7195E1),
                      percent: 0.5,
                      animation: true,
                      animationDuration: 1500,
                      center: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xff7195E1), width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 2.5),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "50%",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SliderWidget(
                    title: "Student GPA",
                    content: CircularPercentIndicator(
                      radius: 65,
                      lineWidth: 11,
                      backgroundColor: const Color(0xfff1f5fc),
                      progressColor: Colors.green,
                      percent: 0.88,
                      animation: true,
                      animationDuration: 1500,
                      center: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 2.5),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "3.3",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    color: const Color(0xfff1f5fc),
                  ),
                  SliderWidget(
                      title: "Reminders",
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (Reminder reminder
                                in context.watch<StudentAction>().reminders)
                              Text(
                                "Task: ${reminder.title}",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Color(0xff7195E1),
                                    fontSize: 18,
                                  ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                          ],
                        ),
                      ),
                      color: Colors.white)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: _sliderCont,
              count: 3,
              effect:
                  const ExpandingDotsEffect(activeDotColor: Color(0xff7195E1)),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashBtn(
                    btnText: "Calendar ",
                    dIcon: Icons.calendar_month,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventPage()));
                    }),
                DashBtn(
                    btnText: "schedule ",
                    dIcon: Icons.table_rows_rounded,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Suggested_Schedule()));
                    })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashBtn(
                    btnText: "Documents ",
                    dIcon: Icons.file_present,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Forms()));
                    }),
                DashBtn(
                    btnText: "major Quiz ",
                    dIcon: Icons.quiz,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => quiz()));
                    })
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // 3 buttons --> send + pay + bills

            // column --> stats + transactions
          ]),
        ),
      );
    }
  }

  setFirstName() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.read(key: "firstName").then((value) => firstName = value!);
  }
}
