import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/action/app_action.dart';
import 'package:virtual_assistant/action/user/model/credential.dart';
import 'package:virtual_assistant/action/user/model/user.dart';
import 'package:virtual_assistant/api/result.dart';
import 'package:virtual_assistant/api/user_api.dart';
import 'package:virtual_assistant/constant/constants.dart';
import 'package:virtual_assistant/model/EnrolledStudent.dart';
import 'package:virtual_assistant/screen/admin/admin_dashboard.dart';
import 'package:virtual_assistant/screen/dashboard/dashboard.dart';
import 'package:virtual_assistant/screen/profile/profile.dart';

import '../../screen/admin/add_course.dart';
import '../../screen/Suggested_Schedule/register_year.dart';

class UserAction with ChangeNotifier, DiagnosticableTreeMixin {
  saveUser(message) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    User user = User.fromJson(message);
    await storage.write(key: "token", value: user.token);
    await storage.write(key: "firstName", value: user.firstName);
    await storage.write(key: "lastName", value: user.lastName);
    await storage.write(key: "email", value: user.email);
    await storage.write(key: "dateOfBirth", value: user.dateOfBirth.toString());
    await storage.write(key: "gender", value: user.gender.name.toString());
    print(user.token);
    // await storage.write(key: "isAdmin", value: user.isAdmin.toString());
  }

  bool validRegisterFields(BuildContext context, User user) {
    if (!emailPattern.hasMatch(user.email) || (user.email.isEmpty)) {
      context.read<AppAction>().errors["email"] = "Please enter a valid email";
    }
    if (user.firstName.isEmpty) {
      context.read<AppAction>().errors["firstName"] =
          "First name is required and cannot be empty";
    }
    if (user.lastName.isEmpty) {
      context.read<AppAction>().errors["lastName"] =
          "Last name is required and cannot be empty";
    }
    if (user.password.isEmpty) {
      context.read<AppAction>().errors["password"] =
          "Password is required and cannot be empty";
    }
    if (user.confirmPassword.isEmpty) {
      context.read<AppAction>().errors["confirmPassword"] =
          "Confirm Password Field is required and cannot be empty";
    }
    if (user.confirmPassword != user.password) {
      context.read<AppAction>().errors["confirmPassword"] =
          "The confirmed password does not match the entered password";
    }
    return Provider.of<AppAction>(context, listen: false).errors.isEmpty;
  }

  register(BuildContext context, User user) {
    context.read<AppAction>().setLoaded();
    Result result;
    if (validRegisterFields(context, user)) {
      UserApi.register(user).then((response) => {
            result = Result.fromJson(jsonDecode(response.body)),
            if (result.success)
              {
                saveUser(result.message),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const plan_year(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              }
            else
              context.read<AppAction>().errors["email"] =
                  "Email already exists",
            context.read<AppAction>().setLoaded()
          });
    }
  }

  
  Future<dynamic> registerEnrolled(BuildContext context, EnrolledStudent enrolledStudent) {
    return UserApi.registerEnrolled(context, enrolledStudent);
  }

  //   registerEnrolled(BuildContext context, EnrolledStudent enrolledStudent) {
  //   context.read<AppAction>().setLoaded();
  //   Result result;
  //     UserApi.registerEnrolled(enrolledStudent).then((response) => {
  //           result = Result.fromJson(jsonDecode(response.body)),
  //           print(response.body),
  //           if (result.success)
  //             {
  //               Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (BuildContext context) =>  const AcademicScreen(),
  //                 ),
  //                 (Route<dynamic> route) => false,
  //               ),
  //             }
  //           else
  //              throw Exception('failed to enroll student'),
  //           context.read<AppAction>().setLoaded()
  //         });
    
  // }
  
  registerAdmin(BuildContext context, User user) {
    context.read<AppAction>().setLoaded();
    Result result;
    if (validRegisterFields(context, user)) {
      UserApi.registerAdmin(user).then((response) => {
            result = Result.fromJson(jsonDecode(response.body)),
            if (result.success)
              {
                saveUser(result.message),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  AddCoursePage(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              }
            else
              context.read<AppAction>().errors["email"] =
                  "Email already exists",
            context.read<AppAction>().setLoaded()
          });
    }
  }

  login(BuildContext context, Credentials credentials) {
    context.read<AppAction>().setLoaded();
    Result result;
    UserApi.login(credentials).then((response) => {
      result = Result.fromJson(jsonDecode(response.body)),
         if (result.success) {
        saveUser(result.message),
                  if(result.message['isAdmin'])
            {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>  AdminDashboard(),
                ),
                    (Route<dynamic> route) => false,
              ),
            }
            else
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Dashboard(),
          ),
          (Route<dynamic> route) => false,
        ),
      }
      // if (result.success)
      //   {
      //     saveUser(result.message),
      //     if(result.message['isAdmin'])
      //       {
      //         Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(
      //             builder: (BuildContext context) =>  AddCoursePage(),
      //           ),
      //               (Route<dynamic> route) => false,
      //         ),
      //       }
      //   }
        
        
      else
        context.read<AppAction>().errors["email"] =
        "Email already exists",
      context.read<AppAction>().setLoaded()
    });
  }

  uploadImage(BuildContext context, File image) {
    UserApi.uploadImage(image);
  }
}
