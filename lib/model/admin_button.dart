import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button_dash extends StatelessWidget {
  final String btnText;
  final IconData dIcon;
  final VoidCallback onPressed;

  const button_dash(
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
        width: 160,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xff7195E1),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 17, color: Colors.white)),
            ),
            Icon(
              dIcon,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
