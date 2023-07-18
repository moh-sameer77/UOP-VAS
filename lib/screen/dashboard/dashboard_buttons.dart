import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBtn extends StatelessWidget {
  final String btnText;
  final IconData dIcon;
  final VoidCallback onPressed;

  const DashBtn(
      {super.key,
      required this.btnText,
      required this.dIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // slider
        width: 125,
        height: 44,
        decoration: const BoxDecoration(
          color: Color(0xfff5f7fd),
          borderRadius: BorderRadius.all(Radius.circular(11)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(55, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2.5),
            )
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xff7195E1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
            Icon(
              dIcon,
              color: const Color(0xff7195E1),
            )
          ],
        ),
      ),
    );
  }
}
