import 'package:flutter/material.dart';

class Reminder {
  late String title;
  late String note;
  late DateTime date;
  late DateTime firstTime;
  late DateTime secondTime;
  late Color color;

  Map<String, dynamic> toJson() => {
        'title': title,
        'note': note,
        'firstTime': DateTime.parse(firstTime.toString())
            .toLocal()
            .toString()
            .replaceFirst(" ", "T"),
        'secondTime': DateTime.parse(secondTime.toString())
            .toLocal()
            .toString()
            .replaceFirst(" ", "T"),
        'date': DateTime.parse(date.toString())
            .toLocal()
            .toString()
            .replaceFirst(" ", "T"),
        'color': color.toString(),
      };

  factory Reminder.fromJson(dynamic json) {
    DateTime now = DateTime.now();
    return Reminder(
      "${json['title']}",
      "${json['note']}",
        DateTime(now.year, now.month, now.day, int.parse(json["firstTime"].toString().split(", ")[3]), int.parse(json["firstTime"].toString().split(", ")[4].replaceAll("]", ""))),
      DateTime(now.year, now.month, now.day, int.parse(json["secondTime"].toString().split(", ")[3]), int.parse(json["secondTime"].toString().split(", ")[4].replaceAll("]", ""))),
      Color(
        int.parse(json["color"].split('(0x')[1].split(')')[0], radix: 16),
      ),
    );
  }

  Reminder(this.title, this.note, this.firstTime, this.secondTime, this.color);

  Reminder.init();
}
