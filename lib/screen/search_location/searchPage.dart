import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant/screen/search_location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

var _controller = TextEditingController();

class _SearchState extends State<Search> {
  launchURL(String url) async {
    if (await launch(url)) {
      await launchURL(url);
    } else {
      throw 'could not Reach';
    }
  }

  static final List<Location> _locationBank = [
    Location("Faculty of Engineering/library", '2', "bulding Number :2"),
    Location("Faculty of Law /Faculty of Mass Communication", '3',
        "bulding Number :3"),
    Location("Faculty of Architecture & design", '4', "bulding Number :4"),
    Location(
        "Faculty of Art and Sciences", '6', "bulding Number :6, building B"),
    Location("Faculty of Art and Sciences", '06', "bulding Number :6"),
    Location("Faculty of Information technology", '7', "bulding Number :7"),
    Location("Faculty of Pharmacy & Medical science", '8', "bulding Number :8"),
    Location("New Faculty of Pharmacy & Medical science", '88',
        "bulding Number :88"),
    Location("Faculty of Administrative & Financial", '9', "bulding Number :9"),
    Location("Faculty of Engineering/library", '21', "First Floor"),
    Location("Faculty of Engineering/library", '22', "Second Floor"),
    Location("Faculty of Engineering/library", '23', "Third Floor"),
    Location("Faculty of Engineering/library", '24', "Fourth Floor"),
    Location("Faculty of Law/Mass Communication", '31', "First Floor"),
    Location("Faculty of Law/Mass Communication", '32', "Second Floor"),
    Location("Faculty of Law/Mass Communication", '33', "Third Floor"),
    Location("Faculty of Law/Mass Communication", '34', "Fourth Floor"),
    Location("Faculty of Architecture & design", '41', "first Floor"),
    Location("Faculty of Architecture & design", '42', "Second Floor"),
    Location("Faculty of Architecture & design", '43', "Third Floor"),
    Location("Faculty of Architecture & design", '44', "Fourth Floor"),
    Location("Faculty of Architecture & design", '45', "Fifth Floor"),
    Location("Faculty of Art and Sciences ", '060', "GF"),
    Location("Faculty of Art and Sciences ", '061', "First Floor"),
    Location("Faculty of Art and Sciences ", '062', "Second Floor"),
    Location("Faculty of Art and Sciences ", '063', "Third Floor"),
    /* Location("Faculty of Art and Sciences ", '60', "GF"),
    Location("Faculty of Art and Sciences ", '61', "First Floor, Building B"),
    Location("Faculty of Art and Sciences ", '62', "Second Floor, Building B"),
    Location("Faculty of Art and Sciences ", '63', "Third Floor, Building B"),*/
    Location("Faculty of Information technology", '71', "First Floor"),
    Location("Faculty of Information technology", '72', "Second Floor"),
    Location("Faculty of Information technology", '73', "Third Floor"),
    Location("Faculty of Information technology", '74', "Fourth Floor"),
    Location("Faculty of Pharmacy & Medical science", '81', "First Floor"),
    Location("Faculty of Pharmacy & Medical science", '82', "Second Floor"),
    Location("Faculty of Pharmacy & Medical science", '83', "Third Floor"),
    Location("Faculty of Pharmacy & Medical science", '84', "Fourth Floor"),
    Location("New Faculty of Pharmacy & Medical science", '881',
        "First Floor, New Building"),
    Location("New Faculty of Pharmacy & Medical science", '882',
        "Second Floor, New Building"),
    Location("New Faculty of Pharmacy & Medical science", '883',
        "Third Floor, New Building"),
    Location("Faculty of Administrative & Financial", '91', "First Floor"),
    Location("Faculty of Administrative & Financial", '92', "Second Floor"),
    Location("Faculty of Administrative & Financial", '93', "Third Floor"),
    Location("Faculty of Administrative & Financial", '94', "Fourth Floor"),
    Location("Faculty of Administrative & Financial", '75', "envalid"),
  ];

  List<Location> display_list = List.from(_locationBank);
  void updatelist(String value) {
    setState(() {
      display_list = _locationBank
          .where(
              (element) => element.classNumber.contains(value.substring(0, 2)))
          .toList();
    });
  } //fillter List

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/uoplocation.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Stack(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: const Color(0xff7195E1),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50, top: 8),
                        child: TextField(
                          onChanged: (value) {
                            if (value.trim().isEmpty) {
                              setState(() {
                                Text("xdxdd");
                              });
                            } else {
                              updatelist(value);
                            }
                          },
                          controller: _controller,
                          style: const TextStyle(color: Color(0xff7195E1)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "eg: 2212 Enter 22",
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: const Color(0xff7195E1),
                            suffixIcon: IconButton(
                              onPressed: _controller.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            suffixIconColor: const Color(0xff7195E1),
                          ),
                        ))
                  ])
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                width: 320,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 253, 253),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      display_list[index].faculty,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 13, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    subtitle: Text(
                      display_list[index].floor,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff7195E1)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  child: const Icon(Icons.place),
                  onPressed: (() {
                    const url =
                        'https://www.google.com/maps/place/University+of+Petra/@31.892725,35.8746684,15z/data=!4m5!3m4!1s0x0:0x77178157a3fbaf45!8m2!3d31.892725!4d35.8746684';
                    launchURL(url);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff7195E1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class squer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Color(0xff7195E1),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: const Text(""),
      ),
    );
  }
}
