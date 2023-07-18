import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:virtual_assistant/model/PassedCourse.dart';
import 'package:virtual_assistant/model/notification.dart';
import 'package:virtual_assistant/screen/admin/addNotification.dart';
import 'package:virtual_assistant/screen/reminder/reminder.dart';
import 'package:virtual_assistant/constant/constants.dart';

class StudentApi {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static String studentUrl = "/api/student";

  static Future<Response> getReminders() async {
    String? token = await storage.read(key: "token");
    print(token);
    return await get(
      Uri.parse("$url$studentUrl/get/reminders"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
    );
  }

    static Future<Response> suggestSchedule() async {
    String? token = await storage.read(key: "token");
    print(token);
    return await get(
      Uri.parse("$url$studentUrl/suggestSchedule"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
    );
  }



      static Future<Response>calculateAcademicProgress() async {
    String? token = await storage.read(key: "token");
    print(token);
    return await get(
      Uri.parse("$url$studentUrl/calculateAcademicProgress"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
    );
  }
  

  static Future<Response> getCourses(int typeId) async {
    return await get(
      Uri.parse("$url$studentUrl/get/coursesByTypes/$typeId"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
      },
    );
  }

    static addPassedCourse(BuildContext context, PassedCourse passedCourse) async {
    return storage.read(key: "token").then((token) async {
      await post(
        Uri.parse("$url$studentUrl/add/PassedCourse"),
        body: convert.jsonEncode(passedCourse.toJson()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token",
        },
      );
    });
  }

    static AddNotification(Notificationn notification) async {
    return storage.read(key: "token").then((token) async {
      await post(
        Uri.parse("$url$studentUrl/add/notification"),
        body: convert.jsonEncode(notification.toJson()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json; charset=UTF-8',
        },
      );
    });
  }

  static addReminder(Reminder reminder) async {
    return storage.read(key: "token").then((token) async {
      await post(
        Uri.parse("$url$studentUrl/add/reminder"),
        body: convert.jsonEncode(reminder.toJson()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token",
        },
      );
    });
  }


}
