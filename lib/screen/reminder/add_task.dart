import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/action/student/student_action.dart';
import 'package:virtual_assistant/screen/reminder/event.dart';

import 'reminder.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

// ignore: camel_case_types
class _AddTaskState extends State<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController _date = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay firstTime = const TimeOfDay(hour: 6, minute: 30);
  TimeOfDay secondTime = const TimeOfDay(hour: 9, minute: 30);
  String? dvalue;
  String? rvalue;
  String dropdownvalue = 'Item 1';
  var items = [
    " None ",
    "Repeat",
  ];
  var reminder = [
    " 5 minutes Early ",
    " 10 minutes Early ",
    "15 minutes Early"
  ];
  int _selectedcolor = 0;
  Map<int, Color> colors = {
    0: const Color(0xff004369),
    1: const Color(0xffDB1F48),
    2: const Color(0xffFAD02C),
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  addTaskMethod(),
                  textFiled(" Title ", "Enter your title", note),
                  textFiled("Note ", 'Enter your Note', title),
                  dateEntery(
                    context,
                  ),
                  timePickertitle(),
                  timePicker(context),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        " Color ",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  colorSelect()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row timePicker(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Container(
          width: 165,
          height: 40,
          padding: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              border: Border.all(width: 1, color: const Color(0xffB1B1B1))),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialEntryMode: TimePickerEntryMode.input,
                              initialTime: firstTime,
                            );

                            setState(() {
                              if (newTime != null) {
                                firstTime = newTime;
                              }
                            });
                          },
                          icon: const Icon(Icons.access_time_rounded)),
                      focusColor: const Color(0xff7195E1),
                      border: InputBorder.none,
                      hintText: '${firstTime.hour} : ${firstTime.minute} ',
                      labelStyle: const TextStyle(color: Color(0xffB1B1B1)),
                      hintStyle: const TextStyle(color: Color(0xffB1B1B1))),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 165,
          height: 40,
          padding: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              border: Border.all(width: 1, color: const Color(0xffB1B1B1))),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialEntryMode: TimePickerEntryMode.input,
                              initialTime: secondTime,
                            );

                            setState(() {
                              if (newTime != null) {
                                secondTime = newTime;
                              }
                            });
                          },
                          icon: const Icon(Icons.access_time_rounded)),
                      focusColor: const Color(0xff7195E1),
                      border: InputBorder.none,
                      hintText: '${secondTime.hour} : ${secondTime.minute} ',
                      labelStyle: const TextStyle(color: Color(0xffB1B1B1)),
                      hintStyle: const TextStyle(color: Color(0xffB1B1B1))),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row colorSelect() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Wrap(
                children: List<Widget>.generate(3, (int index) {
              return GestureDetector(
                onTap: (() {
                  setState(() {
                    _selectedcolor = index;
                  });
                }),
                child: Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? const Color(0xff004369)
                        : index == 1
                            ? const Color(0xffDB1F48)
                            : const Color(0xffFAD02C),
                    child: _selectedcolor == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              );
            })),
            const SizedBox(
              width: 150,
            ),
            InkWell(
              onTap: () {
                Reminder reminder = Reminder.init();
                reminder.title = title.text.trim();
                reminder.note = note.text.trim();
                DateTime now = DateTime.now();
                reminder.firstTime = DateTime(now.year, now.month, now.day,
                    firstTime.hour, firstTime.minute);
                reminder.secondTime = DateTime(now.year, now.month, now.day,
                    secondTime.hour, secondTime.minute);
                reminder.color = colors[_selectedcolor]!;
                reminder.date = _selectedDate;
                context.read<StudentAction>().addReminder(reminder).then((value) => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EventPage(),
                      )),
                });
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: const BoxDecoration(
                    color: Color(0xff000C66),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Center(
                  child: Text(
                    "Add Task",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Container dropDownUltra(List<String> listofitem, String hint) {
    return Container(
      width: 330,
      height: 40,
      padding: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          border: Border.all(width: 1, color: const Color(0xffB1B1B1))),
      child: DropdownButtonHideUnderline(
        child: reminderDropDown(listofitem, hint),
      ),
    );
  }

  DropdownButton<String> reminderDropDown(List<String> lisofitem, String hint) {
    return DropdownButton<String>(
      alignment: Alignment.center,
      hint: Text(
        hint,
        style: const TextStyle(color: Colors.black),
      ),
      dropdownColor: const Color(0xffffffff),
      value: dvalue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      onChanged: (String? newValue) {
        // This is called when the user selects an item.
        setState(() {
          dvalue = newValue!;
        });
      },
      items: lisofitem.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Column timePickertitle() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 35,
            ),
            Text(
              "Start Time",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              width: 105,
            ),
            Text(
              "End Time",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  Column addTaskMethod() {
    return Column(
      children: [
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new)),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Add Task",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Column dateEntery(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Text(
              "Date",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 330,
              height: 40,
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  border: Border.all(width: 1, color: const Color(0xffB1B1B1))),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _date,
                      readOnly: true,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    _date.text = formattedDate;
                                    _selectedDate = pickedDate;
                                  });
                                } else {}
                              },
                              icon: const Icon(Icons.calendar_today_outlined)),
                          focusColor: const Color(0xff7195E1),
                          border: InputBorder.none,
                          hintText: DateFormat.yMd().format(_selectedDate),
                          labelStyle: const TextStyle(color: Color(0xffB1B1B1)),
                          hintStyle: const TextStyle(color: Color(0xffB1B1B1))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column textFiled(
      String title, String hint, TextEditingController controller) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 330,
              height: 40,
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  border: Border.all(width: 1, color: const Color(0xffB1B1B1))),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          focusColor: const Color(0xff7195E1),
                          border: InputBorder.none,
                          hintText: hint,
                          labelStyle: const TextStyle(color: Color(0xffB1B1B1)),
                          hintStyle: const TextStyle(color: Color(0xffB1B1B1))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
