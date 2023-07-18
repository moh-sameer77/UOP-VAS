import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:virtual_assistant/screen/admin/addNotification.dart';
import '../reminder.dart';
import 'studentlist.dart';
import '../../model/admin_button.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();

}

class _AdminDashboardState extends State<AdminDashboard> {

  Map<String, double> dataMap = {
    "IT": 10,
    "Architecture and design": 5,
    "Administrative and Financial Sciences": 6,
    "Arts & Sciences ": 3,
    "Law": 9,
    "Pharmacy": 5,
    "Mass Communication": 3,
    "Engineering": 6,
  };

  @override
  Widget build(BuildContext context) {
    /*List<Color> colors = [
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.lightBlue,
      const Color.fromARGB(255, 0, 8, 255),
      Colors.purple,
      const Color.fromARGB(255, 245, 64, 215),
      Colors.red,
    ];*/
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 230,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xff7195E1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(160),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  alignment: Alignment.topLeft,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios_new),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Welcome... ",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, left: 30),
                        child: Container(
                          width: 330,
                          height: 450,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xff7195E1),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: PieChart(
                            dataMap: dataMap,
                            chartRadius:
                                MediaQuery.of(context).size.width / 1.7,
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.bottom,
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                              chartValueBackgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 520.0, left: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            button_dash(
                                btnText: "reminder",
                                dIcon: Icons.add_alarm,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Addremindar()))
                                              );
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            button_dash(
                                btnText: "Notification",
                                dIcon: Icons.notification_add_outlined,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              AddNotification()))
                                              );                                
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            button_dash(
                                btnText: "students",
                                dIcon: Icons.person,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Viewinformation())));
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            button_dash(
                                btnText: "messages",
                                dIcon: Icons.message,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Viewinformation())));
                                }),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
