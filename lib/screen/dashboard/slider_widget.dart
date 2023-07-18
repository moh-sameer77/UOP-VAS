import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final Color color;

  const SliderWidget({
    super.key,
    required this.title,
    required this.content,
    required this.color,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 3),
      child: Container(
              // slider
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(55, 0, 0, 0),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2.5),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text( title,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xff7195E1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 content,
                ],
              ),
            ),
    );
  }
}