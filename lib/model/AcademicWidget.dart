import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AcademicWidget {
  late String nameOfWidget;
  late Color color;
  AcademicWidget(this.nameOfWidget, this.color);
}

class academicWidgetList {
  List<AcademicWidget> nList = [
    AcademicWidget("University Requirements", const Color(0xff7195E1)),
    AcademicWidget("Faculty Compulsory Requirement", const Color(0xff7195E1)),
    AcademicWidget(
        "Department Compulsory Requirements", const Color(0xff7195E1)),
    AcademicWidget(
        "Department Elective Requirements ", const Color(0xff7195E1)),
  ];
}
