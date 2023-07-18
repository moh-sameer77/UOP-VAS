
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/model/notification.dart';
import '../reminder.dart';
import 'admin_dashboard.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Stack(
            children: [
              Column(children: [
                Container(
                  height: 260,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff7195E1),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminDashboard()));
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        "Add Notification",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white)),
                      ),
                      Text(
                        "  To alert Students with new Updates, Events and Announcements   ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 24, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 200),
                  child: Text(
                    "Title",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xff7195E1))),
                  ),
                ),
                Column(children: [
                  SizedBox(
                    width: 310,
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: const Color(0xff7195E1), width: 2)),
                          hintText: "Write the title..",
                          hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                        )),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 200),
                  child: Text(
                    "Note",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xff7195E1))),
                  ),
                ),
                Container(
                  width: 310,
                  height: 150,
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
                  child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Write content of the Notification..",
                        hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 16,
                        )),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Notificationn notificationn = Notificationn.init();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Addremindar()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff7195E1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            )),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              " Send ",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 17, color: Colors.white)),
                            ),
                          ],
                        )),
                  ),
                ),
              ]),
            ],
          )),
        ),
      ),
    );
  }
}
