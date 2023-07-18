import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/auth/register/admin_register.dart';
import 'package:virtual_assistant/screen/auth/register/register_page.dart';

class StepOneRegister extends StatelessWidget {
  const StepOneRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/topCircle.png"),
                      IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop()),
                    ],
                  ),
                  SizedBox(
                    width: 1.5.w,
                  ),
                  Text(
                    "Step 1: Register ",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0.sp,
                            color: const Color(0xff7195E1),
                            fontSize: 26.sp,
                            shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.4.sp),
                              offset: Offset(0.w, 2.h),
                              blurRadius: 7),
                        ])),
                  ),
                ],
              ),
              Image.asset("assets/Step1Register.png"),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Are you enrolled in an institution?",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0.sp,
                        color: const Color(0xff7195E1),
                        fontSize: 18.sp,
                        shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.4.sp),
                          offset: Offset(0.w, 2.h),
                          blurRadius: 7),
                    ])),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminRegister()),
                ),
                child: Container(
                  //Yes, I'm enrolled button
                  width: 380.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                      color: const Color(0xff7195E1)),
                  child: Center(
                    child: Text("Admin Registration",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0.sp,
                                color: const Color(0xffffffff),
                                shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.4.sp),
                                  offset: Offset(0.w, 2.h),
                                  blurRadius: 7),
                            ]))),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                ),
                child: Container(
                  //Yes, I'm enrolled but I'm confused button
                  width: 380.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                      color: const Color(0xff7195E1)),
                  child: Center(
                    child: Text("Yes, I'm enrolled but I'm confused.",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0.sp,
                                color: const Color(0xffffffff),
                                shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.4.sp),
                                  offset: Offset(0.w, 2.h),
                                  blurRadius: 7),
                            ]))),
                  ),
                ),
              ),
              SizedBox(
                height: 51.9.h,
              ),
              Text("Step 1: Register ",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2.0.sp,
                          color: const Color(0xff7195E1),
                          shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.4.sp),
                            offset: Offset(0.w, 2.h),
                            blurRadius: 7.r),
                      ]))),
              SizedBox(
                height: 6.h,
              ),
              Container(
                width: 155.w,
                height: 5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.r)),
                    color: const Color(0xff7195E1)),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Image.asset("assets/bottomCircle.png")],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
