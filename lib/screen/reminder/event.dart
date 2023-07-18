import 'package:date_format/date_format.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/screen/reminder/reminder.dart';
import 'package:virtual_assistant/action/student/student_action.dart';
import 'package:virtual_assistant/screen/reminder/add_task.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  DateFormat formatter = DateFormat('MMM');
  late String monthAbbr = formatter.format(DateTime.now());
  late List<Reminder> reminders;
  
  @override
  void initState() {
    context.read<StudentAction>().getReminders(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hiderWidget(context),
            calenderSet(),
            const SizedBox(
              height: 15,
            ),
            for (Reminder reminder in context.watch<StudentAction>().reminders)
              Column(
                children: [
                  taskToDo(reminder),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
          ],
        )),
      ),
    );
  }

  Container taskToDo(Reminder reminder) {
    return Container(
      height: 120,
      width: 380,
      decoration: BoxDecoration(
          color: reminder.color,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                reminder.title,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.access_time_rounded,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${reminder.firstTime.hour} : ${reminder.firstTime.minute}  - ${reminder.secondTime.hour} : ${reminder.secondTime.minute} ",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                reminder.note,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox calenderSet() {
    return SizedBox(
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color(0xff000C66),
        selectedTextColor: Colors.white,
        dateTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Column hiderWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              formatDate(DateTime.now(), [monthAbbr, ' ', dd, ',', yyyy])
                  .toString(),
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 24, color: Colors.grey[400])),
            ),
            const SizedBox(
              width: 100,
            ),
            InkWell(
              onTap: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTask()),
                );
              },
              child: Container(
                width: 130,
                height: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff000C66),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Center(
                  child: Text(
                    "+ Add Task",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text("Today",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 24,
                )))
          ],
        )
      ],
    );
  }
}
