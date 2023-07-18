import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/admin/studentinfo.dart';
import '../../model/info.dart';

class Viewinformation extends StatefulWidget {
  @override
  State<Viewinformation> createState() => _ViewInfoState();
}

var _controller = TextEditingController();

class _ViewInfoState extends State<Viewinformation> {
  static final List<studeninfo> _studenBank = [
    studeninfo("ahmad", 5, 2.5, "ahmad@.com", "It", "CS"),
    studeninfo("Khalid", 5, 2.4, "ahmad@.com", "It", "CS"),
    studeninfo("rrr", 5, 2.4, "ahmad@.com", "It", "CS"),
    studeninfo("sss", 5, 2.4, "ahmad@.com", "It", "CS"),
    studeninfo("xxx", 5, 2.4, "ahmad@.com", "It", "CS")
  ];

  List<studeninfo> display_list = List.from(_studenBank);
  void updatelist(String value) {
    setState(() {
      display_list = _studenBank
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  } //fillter List

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: const Color(0xff7195E1),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50, top: 8),
                        child: TextField(
                          onChanged: (value) => updatelist(value),
                          controller: _controller,
                          style: const TextStyle(color: Color(0xff7195E1)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: const Color(0xff7195E1), width: 2)),
                            hintText: "Student name",
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: const Color(0xff7195E1),
                            suffixIcon: IconButton(
                              onPressed: _controller.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            suffixIconColor: const Color(0xff7195E1),
                          ),
                        ))
                  ])
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                    color: const Color(0xff7195E1),
                    width: 2,
                  ),
                ),
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      display_list[index].name,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: const Color(0xff7195E1),
                        ),
                      ),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentInfo()),
                          );
                        },
                        child: Text(
                          "view",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 3, 8),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
