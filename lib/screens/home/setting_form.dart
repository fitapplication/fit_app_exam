import 'package:flutter/material.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Title(
          color: Colors.black,
          child: Text('PRIVACY INFORMATIONS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
      SizedBox(
        height: 10,
      ),
      Expanded(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                  'PERSONAL DATA WE COLLECT:\n\nWe collect personal data in three main ways:\n-Some data is provided directly by the user (e.g. by registering for an account).\n-Some data are automatically recorded by us\n-Some data comes to us from third parties\n\nWe collect data that you decide to provide to us in any way. It is not mandatory to disclose information when prompted, but if you decline, you may not be able to access certain features.\n-Email address, date of birth, name used within the game (e.g. when registering for an account) and similar contact details (such as when registering to create an account)\n-Username, password and other details that help us protect and provide access\n-Data that you decide to provide to us (which may include health data and other "sensitive" data) and that allow us to make the service more accessible by meeting any specific needs, for example in case of deafness, difficulty hearing, blindness or visual impairment.')))
    ]);
  }
}
