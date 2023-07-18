import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/action/app_action.dart';
import 'package:virtual_assistant/action/user/user_action.dart';
import 'package:virtual_assistant/constant/colors.dart';
import 'package:virtual_assistant/model/profile_category.dart';
import 'package:virtual_assistant/screen/auth/register/step_one_register.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  File? _selectedImage;
  String fullName = "";
  String email = "";
  late AnimationController controller;

  String firstName = "";

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    setUserData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<ProfileCategory> listofitems = [
    ProfileCategory(
        Icons.edit_sharp,
        ' Edit profile information ',
        Container(),
        Icons.notifications,
        'Notifications',
        Text(
          "ON",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
        ),
        Icons.translate_outlined,
        'Language',
        Text("English",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)))),
    ProfileCategory(
      Icons.person,
      ' Help & Support',
      Container(),
      Icons.message_outlined,
      'Contact us',
      Container(),
      Icons.lock,
      'Language',
      Container(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  color: primary,
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () async {
                        await ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((value) async {
                          uploadImage(value!);
                        });
                      },
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.transparent,
                        backgroundImage: _selectedImage == null
                            ? Image.asset(
                                "assets/profile-pic.png",
                              ).image
                            : Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                              ).image,
                      ),
                    ),
                  ),
                  Text(fullName,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff7195E1)))),
                  Text(email,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff7195E1)))),
                  const SizedBox(height: 20),
                  category(listofitems[0]),
                  const SizedBox(
                    height: 30,
                  ),
                  category(listofitems[1]),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () async {
                        await const FlutterSecureStorage().deleteAll().then(
                              (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StepOneRegister()),
                              ),
                            );
                      },
                      child: const Center(
                        child: Text("Sign out", style: TextStyle(color: primary)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  setUserData() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.readAll().then((value) {
      setState(() {
        fullName = '${value['firstName']} ${value['lastName']}';
        email = '${value['email']}';
      });
    });
  }

  void uploadImage(XFile value) {
    context.read<UserAction>().uploadImage(context, File(value.path));
    setState(() {
      _selectedImage = File(value!.path);
    });
  }
}

Container category(ProfileCategory cat) {
  return Container(
    width: 342,
    height: 150,
    decoration: const BoxDecoration(
        color: Color(0xff7195E1),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                cat.icon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Text(cat.titleCatgeory,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffffffff)))),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: cat.cat,
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                cat.firstIcon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Text(cat.titleCatgeoryFirst,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffffffff)))),
            Expanded(child: Container()),
            Padding(padding: const EdgeInsets.all(8.0), child: cat.catg)
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                cat.seconedIcon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Text(cat.titleCatgeoryseconed,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffffffff)))),
            Expanded(child: Container()),
            Padding(padding: const EdgeInsets.all(8.0), child: cat.catge)
          ],
        )
      ],
    ),
  );
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;

  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.8824525);
    path_0.cubicTo(size.width, size.height * 0.8824525, size.width * 0.6967154,
        size.height * 1.000464, size.width * 0.4974359, size.height);
    path_0.cubicTo(size.width * 0.3001282, size.height * 0.9995361, 0,
        size.height * 0.8824525, 0, size.height * 0.8824525);
    path_0.lineTo(0, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
