import 'package:flutter/material.dart';

enum selectedNot { ON, OF, none }

enum lang { EN, AR, none }

class ProfileCategory {
  late IconData icon;
  late String titleCatgeory;
  late Widget cat;
  late IconData firstIcon;
  late String titleCatgeoryFirst;
  late Widget catg;
  late IconData seconedIcon;
  late String titleCatgeoryseconed;
  late Widget catge;

  ProfileCategory(
      this.icon,
      this.titleCatgeory,
      this.cat,
      this.firstIcon,
      this.titleCatgeoryFirst,
      this.catg,
      this.seconedIcon,
      this.titleCatgeoryseconed,
      this.catge,
      );
}