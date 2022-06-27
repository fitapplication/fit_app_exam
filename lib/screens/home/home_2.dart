import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fit_app_exam/models/pet.dart';
import 'package:fit_app_exam/screens/home/profileedit.dart';
import 'package:fit_app_exam/screens/home/setting_form.dart';
import 'package:fit_app_exam/screens/stats.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/services/database.dart';
import 'package:fit_app_exam/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:fit_app_exam/models/user.dart';

int algorithm(var sleepHours, var exerciceHours) {
  double par2 = 0;
  double par1 = 0;
  double par3 = 0;
  int results = 0;

  if (sleepHours < 8) {
    par1 = (sleepHours - 8) / 8;
  }
  if (exerciceHours < 2) {
    par2 = (exerciceHours - 2) / 2;
  }
  if (workoutHours < 0.8) {
    par3 = (workoutHours - 0.8) / 0.8;
  }
  if (par1 == par2 && par1 == par3) {
    results = 3;
  } else if (par2 < par1 && par3 < par1) {
    results = 2;
  } else if (par1 < par2 && par3 < par2) {
    results = 1;
  } else if (par1 < par3 && par2 < par3) {
    results = 4;
  }

  return results;
}

String check(int test) {
  String imagecheck = '';

  if (test == 1) {
    imagecheck = "https://c.tenor.com/OTiUFg5Z2coAAAAC/pusheen-play.gif";
  } else if (test == 2) {
    imagecheck = "https://c.tenor.com/MVwqWHzPXNwAAAAC/pusheen-goodnight.gif";
  } else if (test == 3) {
    imagecheck = 'https://c.tenor.com/sJnOE_eYvFcAAAAC/pusheen.gif';
  } else if (test == 4) {
    imagecheck = 'https://c.tenor.com/qnS4hoUXnQMAAAAC/pusheen.gif';
  }
  return imagecheck;
}

String checktext(int test) {
  String textcheck = '';
  if (test == 1) {
    textcheck = 'Your pet needs less calories!';
  } else if (test == 2) {
    textcheck = 'Your pet needs more sleep!';
  } else if (test == 3) {
    textcheck = 'Your pet is perfectly healty!';
  } else if (test == 4) {
    textcheck = 'Your pet needs to work out!';
  }
  return textcheck;
}

class home_2 extends StatefulWidget {
  @override
  State<home_2> createState() => _home_2State();
}

var sleepHours = Random().nextDouble() * 10;
var exerciceHours = Random().nextDouble() * 4;
var workoutHours = Random().nextDouble() * 1;
int test = algorithm(sleepHours, exerciceHours);

class _home_2State extends State<home_2> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Username>(context);
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: const SettingsForm(),
            );
          });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('PetFit'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: const Icon(Icons.person_off),
              label: const Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
                onPressed: () => _showSettingPanel(),
                icon: const Icon(Icons.privacy_tip),
                label: const Text('Privacy Info'))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
                tooltip: 'Profile',
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.stacked_bar_chart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Graphs()));
                },
                tooltip: 'Stats',
              ),
            ],
          ),
        ),
        body: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData? userData = snapshot.data;
                return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: <Widget>[
                      Expanded(
                          flex: 70,
                          child: Container(
                            // width: MediaQuery.of(context).size.width *0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(check(test)),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                color: const Color.fromARGB(255, 185, 19, 19),
                                width: 8,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),

                            margin: const EdgeInsets.all(10.0),
                          )),
                      Expanded(
                          flex: 50,
                          child: Container(
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                Text(userData?.nickname ?? 'Nickname',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40)),
                                Text(checktext(test),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 30)),
                                Icon(Icons.ramen_dining_rounded,
                                    color: Colors.indigo[900], size: 100.0),
                              ])))
                    ]));
              } else {
                return Loading();
              }
            }));
  }
}
