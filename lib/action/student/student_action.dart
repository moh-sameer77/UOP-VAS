import 'dart:async';
import 'dart:convert' as convert;
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/action/app_action.dart';
import 'package:virtual_assistant/model/Course.dart';
import 'package:virtual_assistant/model/PassedCourse.dart';
import 'package:virtual_assistant/model/notification.dart';
import 'package:virtual_assistant/screen/admin/addNotification.dart';
import 'package:virtual_assistant/screen/reminder/reminder.dart';
import 'package:virtual_assistant/api/student_api.dart';

class StudentAction with ChangeNotifier, DiagnosticableTreeMixin {
  List<Reminder> _reminders = [];
  List<Reminder> get reminders => _reminders;

   List<Course> _suggestedSchedule = [];
   List<Course> get suggestedSchedule => _suggestedSchedule;



 List<Course> _universityReqs = [];
  List<Course> _facultyCompReqs = [];

 List<Course> _departmentCompReqs = [];

 List<Course> _departmentElectives = [];


  List<Course> get universityReqs => _universityReqs;
  List<Course> get facultyCompReqs => _facultyCompReqs;
  List<Course> get departmentCompReqs => _departmentCompReqs;
  List<Course> get departmentElectives => _departmentElectives;





  getReminders(BuildContext context) async {
    context.read<AppAction>().setLoaded();
    await StudentApi.getReminders().then((response) {
      List list =
          convert.jsonDecode(response.body)["message"]["content"] as List;
      _reminders = list.map((reminder) => Reminder.fromJson(reminder)).toList();
      context.read<AppAction>().setLoaded();
    });
    notifyListeners();
  }

    suggestSchedule(BuildContext context) async {
    context.read<AppAction>().setLoaded();
    await StudentApi.suggestSchedule().then((response) {
List list = convert.jsonDecode(response.body)['message'] as List;
   
      _suggestedSchedule = list.map((course) => Course.fromJson(course)).toList();
      print(_suggestedSchedule);
      context.read<AppAction>().setLoaded();
    });
    notifyListeners();
  }

  //    calculateAcademicProgress(BuildContext context) async {
  //   context.read<AppAction>().setLoaded();
  //   await StudentApi.calculateAcademicProgress().then((response) {
  //      final Map<String, dynamic> data = convert.jsonDecode(response.body);
  //     final double academicProgress = data['academicProgress'];   
  //     print(academicProgress);
  //     context.read<AppAction>().setLoaded();
  //   });
  //   notifyListeners();
  // }

  getCourses(BuildContext context, int typeId) async {
    context.read<AppAction>().setLoaded();
    await StudentApi.getCourses(typeId).then((response) {
List list = convert.jsonDecode(response.body)['message'] as List;
      if(typeId == 1){
      _universityReqs = list.map((course) => Course.fromJson(course)).toList();
      print(_universityReqs);
      }
      else if (typeId == 2){
      _facultyCompReqs = list.map((course) => Course.fromJson(course)).toList();
      }
      else if(typeId == 3){
         _departmentCompReqs = list.map((course) => Course.fromJson(course)).toList();
      }
      else if (typeId == 5){
         _departmentElectives = list.map((course) => Course.fromJson(course)).toList();
               print(_departmentElectives);

      }

      context.read<AppAction>().setLoaded();
    });
    notifyListeners();
  }


  Future<dynamic> addReminder(Reminder reminder) {
    return StudentApi.addReminder(reminder);
  }

    Future<dynamic> AddNotification(Notificationn notificationn) {
    return StudentApi.AddNotification(notificationn);
  }

    Future<dynamic> addPassedCourse(BuildContext context, PassedCourse passedCourse) {
    return StudentApi.addPassedCourse(context, passedCourse);
  }
}
