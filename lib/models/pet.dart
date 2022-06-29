import 'package:flutter/material.dart';
import 'package:fit_app_exam/models/user.dart';

class pet {
  final String name;
  final String surname;
  final String age;
  final String weigth;
  final String heigth;
  final String nickname;
  final String userID;
  final String loginDate;
  final List step;
  final List calories;
  final List workout;
  final List sleep;

  pet(
      {required this.name,
      required this.surname,
      required this.age,
      required this.heigth,
      required this.weigth,
      required this.nickname,
      required this.userID,
      required this.loginDate,
      required this.step,
      required this.calories,
      required this.workout,
      required this.sleep});
}
