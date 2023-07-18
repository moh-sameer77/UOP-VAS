import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container courseGreen(String txt) {
  return Container(
    width: 102,
    height: 80,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.green),
    child: Center(
        child: Text(txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 12, color: Colors.white)))),
  );
}

Container coursegray(String txt) {
  return Container(
    width: 102,
    height: 80,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromARGB(255, 144, 144, 144)),
    child: Center(
        child: Text(txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 12, color: Colors.white)))),
  );
}

Container coursered(String txt) {
  return Container(
    width: 102,
    height: 80,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.red),
    child: Center(
        child: Text(txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 12, color: Colors.white)))),
  );
}

Container semestar(String txt) {
  return Container(
    width: 150,
    height: 40,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xff7195E1)),
    child: Center(
        child: Text(txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 15, color: Colors.white)))),
  );
}
