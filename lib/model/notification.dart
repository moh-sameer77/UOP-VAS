import 'package:flutter/material.dart';

class Notificationn {
  late String title;
  late String description;
 

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
              };

  factory Notificationn.fromJson(dynamic json) {
    return Notificationn(
      json['title'],
      json['note'],

    );
  }

  Notificationn(this.title, this.description);
  Notificationn.init();
}
