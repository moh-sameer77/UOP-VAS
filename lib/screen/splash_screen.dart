import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/Suggested_Schedule/suggested_schedule.dart';
import 'package:virtual_assistant/screen/auth/register/register_page.dart';
import 'package:virtual_assistant/screen/Suggested_Schedule/register_year.dart';
import 'package:virtual_assistant/screen/dashboard/dashboard.dart';
import 'dart:async';

import 'Suggested_Schedule/Academic_Screen.dart';
import 'auth/register/step_one_register.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _navigateUser();
  }

  _navigateUser() async {
    await Future.delayed(const Duration(seconds: 2), () {
      storage.read(key: "token").then((value) => {
            if (value != null && value.trim().isNotEmpty)
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const Dashboard(),
                  ))
            else
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StepOneRegister(),
                  )),
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7195E1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/business-3d-with-phone-man-5 1.png",
                          height: 366,
                          width: 261,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 275.0),
                      child: ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          height: 447,
                          width: double.infinity,
                          decoration:
                              const BoxDecoration(color: Color(0xffffffff)),
                          child: Center(
                              child: Text(
                            "UOP Virtual\n Assistant",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff7195E1))),
                          )),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;

  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9957143);
    path0.cubicTo(0, size.height * 0.3002500, size.width * -0.0077583,
        size.height * 0.3978571, 0, size.height * 0.1706857);
    path0.quadraticBezierTo(
        size.width * 0.2224500, size.height * 0.1927429, size.width, 0);
    path0.lineTo(size.width * 0.9969417, size.height * 0.9905000);
    path0.quadraticBezierTo(size.width * 0.7477062, size.height * 0.9918036, 0,
        size.height * 0.9957143);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
