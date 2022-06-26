import 'package:flutter/material.dart';
import 'package:loginfede/models/user.dart';
import 'package:loginfede/screens/authenticate/authenticat.dart';
import 'package:loginfede/screens/home/home_2.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Username?>(context);

    //return home or auth

    if (user == null) {
      return Authenticate();
    } else {
      return home_2();
    }
  }
}
