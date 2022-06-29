import 'dart:math';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_exam/screens/home/profileedit.dart';
import 'package:fit_app_exam/screens/home/setting_form.dart';
import 'package:fit_app_exam/screens/stats.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/services/database.dart';
import 'package:fit_app_exam/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:fit_app_exam/models/user.dart';
import 'package:fit_app_exam/screens/home/globals.dart' as globals;

int algorithm(var heartRate, var exerciceHours, var workoutHours) {
  double par2 = 0;
  double par1 = 0;
  double par3 = 0;
  int results = 0;

  if (heartRate < 8) {
    par1 = (8 - heartRate) / 8;
  }
  if (exerciceHours < 2) {
    par2 = (2 - exerciceHours) / 2;
  }
  if (workoutHours < 0.8) {
    par3 = (0.8 - workoutHours) / 0.8;
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

double algorithm_bar(var heartRate, var exerciceHours, var workoutHours) {
  double par2 = 0;
  double par1 = 0;
  double par3 = 0;
  double results = 0;

  if (heartRate < 8) {
    par1 = (8 - heartRate) / 8;
  }
  if (exerciceHours < 2) {
    par2 = (2 - exerciceHours) / 2;
  }
  if (workoutHours < 0.8) {
    par3 = (0.8 - workoutHours) / 0.8;
  }
  if (par1 == par2 && par1 == par3) {
    results = 0.0;
  } else if (par2 < par1 && par3 < par1) {
    results = par1;
  } else if (par1 < par2 && par3 < par2) {
    results = par2;
  } else if (par1 < par3 && par2 < par3) {
    results = par3;
  }

  return results;
}

String check(int test) {
  String imagecheck = '';

  if (test == 1) {
    imagecheck = "https://c.tenor.com/OTiUFg5Z2coAAAAC/pusheen-play.gif";
  } else if (test == 2) {
    imagecheck = "https://c.tenor.com/TRZAcsIM70oAAAAC/grrr-cat.gif";
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
    textcheck = 'Your pet needs to relax!';
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

var heartRate = Random().nextDouble() * 10;
var exerciceHours = Random().nextDouble() * 4;
var workoutHours = Random().nextDouble() * 1;
String? _currentLoginDate;

double percentageCompletion =
    (1 - (algorithm_bar(heartRate, exerciceHours, workoutHours))) * 100;

int test = algorithm(heartRate, exerciceHours, workoutHours);

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
                  globals.checknick = true;
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
                _currentLoginDate = DateTime.now().toString();
                if (userData!.nickname!.isEmpty) {
                  return Profile();
                } else {
                  List olddate = userData.loginDate!.split(' ');
                  List actualdate = _currentLoginDate!.split(' ');

                  List oldday = olddate[0].split('-');
                  List actualday = actualdate[0].split('-');
                  List oldhour = olddate[1].split(':');
                  List actualhour = actualdate[1].split(':');
                  String old_day = oldday[2];
                  String actual_day = actualday[2];

                  if (int.parse(actual_day) - int.parse(old_day) != 0) {
                    globals.checknick = false;
                    return Profile();
                  }
                  String old_hour = oldhour[0];
                  String actual_hour = actualhour[0];
                  if (int.parse(actual_hour) - int.parse(old_hour) > 8) {
                    globals.checknick = false;
                    return Profile();
                  }

                  globals.checknick = true;
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
                            flex: 40,
                            child: Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                  Icon(Icons.pets_outlined,
                                      color: Colors.indigo[900], size: 50.0),
                                  Text(userData.nickname ?? 'Nickname',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40)),
                                  Text(checktext(test),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(fontSize: 30)),
                                  LinearPercentIndicator(
                                    lineHeight: 40.0,
                                    alignment: MainAxisAlignment.center,
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    animation: true,
                                    animationDuration: 1200,
                                    padding: const EdgeInsets.only(top: 10.0),
                                    percent: (1 -
                                        (algorithm_bar(heartRate, exerciceHours,
                                            workoutHours))),
                                    progressColor: Colors.red,
                                    backgroundColor: Colors.green,
                                    center: Text(
                                      'You have completed ${double.parse(percentageCompletion.toStringAsFixed(2))}% of your daily goal',
                                      textAlign: TextAlign.center,
                                    ),
                                    barRadius: const Radius.circular(15),
                                  )
                                ])))
                      ]));
                }
              } else {
                return Loading();
              }
            }));
  }
}
