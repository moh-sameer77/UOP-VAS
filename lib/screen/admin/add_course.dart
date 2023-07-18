import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCoursePage extends StatelessWidget {
  AddCoursePage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 150,
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
                          Text(" Academic Plan",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              textFiled(" Academic Plan Credit Hours ", "Enter your Hours",
                  _controller1),
              const SizedBox(
                height: 20,
              ),
              textFiled(
                  "Academic Plan Name ", 'Enter your Plan Name', _controller),
              InkWell(
                onTap: () {
                  AlertDialog(
                      title: Text('TextField AlertDemo'),
                      content: TextField(
                        controller: _controller,
                        decoration:
                        InputDecoration(hintText: "TextField in Dialog"),
                      ));
                },
                child: Container(
                  height: 80,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Color(0xff7195E1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text("send ",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                      color: Color(0xff7195E1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
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
                  border: Border.all(width: 2, color: const Color(0xff7195E1))),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          focusColor: const Color(0xff7195E1),
                          border: InputBorder.none,
                          hintText: hint,
                          labelStyle: const TextStyle(color: Color(0xff7195E1)),
                          hintStyle: const TextStyle(color: Color(0xff7195E1))),
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