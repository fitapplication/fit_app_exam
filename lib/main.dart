import 'package:fit_app_exam/Screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'Screens/fetch_fit.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This specifies the app entrypoint
      initialRoute: FetchFit.route,
      //This maps names to the set of routes within the app
      routes: {
        FetchFit.route: (context) => FetchFit(),
      },
    );
  } //build
}//MyApp