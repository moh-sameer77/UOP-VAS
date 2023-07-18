import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/action/user/model/credential.dart';
import 'package:virtual_assistant/action/user/user_action.dart';
import 'package:virtual_assistant/forms.dart';
import 'package:virtual_assistant/screen/auth/register/register_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 73.h,
                ),
                Stack(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                        color: const Color(0xff7195E1),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Image.asset("assets/business-3d-with-phone-man-5 1.png",
                            height: 165.h, width: 131.w),
                        SizedBox(
                          width: 30.w,
                        ),
                        Text("UOP Virtual \n Assistant ",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff7195E1))))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Container(
                        height: 650.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xff7195E1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(" Welcome back ! ",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffffff)))),
                            SizedBox(
                              height: 30.h,
                            ),
                            Image.asset(
                              "assets/Group 3.png",
                              height: 155,
                              width: 164,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            buildEmail("   Email ", false, 'name@example.com'),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildPassword("   Password", true, ""),
                            SizedBox(
                              height: 20.h,
                            ),
                            signinWidget(context),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50.h,
                                ),
                                Text(" don’t have an account? ",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xffffffff)))),
                                signup(),
                              ],
                            ),
                          ],
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

  InkWell signup() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterPage()));
      },
      child: SizedBox(
        child: Text(" Sign up ",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff)))),
      ),
    );
  }

  InkWell signinWidget(BuildContext context) {
    Credentials credentials =  Credentials.init();
    credentials.email = emailController.text.trim();
    credentials.password = passwordController.text;



    return InkWell(
      onTap: () async {
        await context.read<UserAction>().login(context, credentials);
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Center(
          child: Text(" Sign In ",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7195E1)))),
        ),
      ),
    );
  }

  Widget buildEmail(String txt, bool hideText, String hTxt) => SizedBox(
        width: 300.w,
        height: 50.h,
        child: TextField(
          controller: emailController,
          obscureText: hideText,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: emailController.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : const Icon(Icons.close),
                onPressed: () => emailController.clear(),
              ),
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: txt,
              hintText: hTxt,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffffff)),
                  borderRadius: BorderRadius.all(Radius.circular(40)))),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
        ),
      );

  Widget buildPassword(String txt, bool hideText, String hTxt) => SizedBox(
        width: 300.w,
        height: 50.h,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffffffff),
              labelText: txt,
              hintText: hTxt,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffffff)),
                  borderRadius: BorderRadius.all(Radius.circular(40)))),
          textInputAction: TextInputAction.done,
        ),
      );
}
