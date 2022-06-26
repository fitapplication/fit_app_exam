import 'package:flutter/material.dart';

class pet {
  final String name;
  final String surname;
  final String age;
  final String weigth;
  final String heigth;
  final String nickname;
  final String userID;
  final List step;

  pet(
      {required this.name,
      required this.surname,
      required this.age,
      required this.heigth,
      required this.weigth,
      required this.nickname,
      required this.userID,
      required this.step});
}
