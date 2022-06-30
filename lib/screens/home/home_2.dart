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

int algorithm(var heartRate, var calories, var workoutMinutes, var step) {
  double par2 = 0;
  double par1 = 0;
  double par3 = 0;
  double par4 = 0;
  int results = 0;

  if (heartRate > 75) {
    par1 = (heartRate - 75) / 75;
  }
  if (calories < 1800) {
    par2 = (1800 - calories) / 1800;
  }
  if (workoutMinutes < 22) {
    par3 = (22 - workoutMinutes) / 22;
  }
  if (step < 10000) {
    par4 = (10000 - step) / 10000;
  }
  if (par1 == par2 && par1 == par3 && par1 == par4) {
    results = 5;
  } else if (par2 < par1 && par3 < par1 && par4 < par1) {
    results = 1;
  } else if (par1 < par2 && par3 < par2 && par4 < par2) {
    results = 2;
  } else if (par1 < par3 && par2 < par3 && par4 < par3) {
    results = 3;
  } else if (par1 < par4 && par2 < par4 && par3 < par4) {
    results = 4;
  }

  return results;
}

double algorithm_bar(
    var heartRate, var calories, var workoutMinutes, var step) {
  double par2 = 0;
  double par1 = 0;
  double par3 = 0;
  double par4 = 0;
  double results = 0;

  if (heartRate > 75) {
    par1 = (heartRate - 75) / 75;
  }
  if (calories < 1800) {
    par2 = (1800 - calories) / 1800;
  }
  if (workoutMinutes < 22) {
    par3 = (22 - workoutMinutes) / 22;
  }
  if (step < 10000) {
    par4 = (10000 - step) / 10000;
  }
  if (par1 == par2 && par1 == par3 && par1 == par4) {
    results = 0.0;
  } else if (par2 < par1 && par3 < par1 && par4 < par1) {
    results = par1;
  } else if (par1 < par2 && par3 < par2 && par4 < par2) {
    results = par2;
  } else if (par1 < par3 && par2 < par3 && par4 < par3) {
    results = par3;
  } else if (par1 < par4 && par2 < par4 && par3 < par4) {
    results = par4;
  }

  return results;
}

String check(int test) {
  String imagecheck = '';

  if (test == 2) {
    imagecheck = "https://c.tenor.com/OTiUFg5Z2coAAAAC/pusheen-play.gif";
  } else if (test == 1) {
    imagecheck = "https://c.tenor.com/TRZAcsIM70oAAAAC/grrr-cat.gif";
  } else if (test == 5) {
    imagecheck = 'https://c.tenor.com/sJnOE_eYvFcAAAAC/pusheen.gif';
  } else if (test == 3) {
    imagecheck = 'https://c.tenor.com/rQGUXTIPMOgAAAAC/lazy-pusheen.gif';
  } else if (test == 4) {
    imagecheck = 'https://c.tenor.com/qnS4hoUXnQMAAAAC/pusheen.gif';
  }
  return imagecheck;
}

String checktext(int test) {
  String textcheck = '';
  if (test == 2) {
    textcheck = 'Your pet needs less calories!';
  } else if (test == 1) {
    textcheck = 'Your pet needs to relax!';
  } else if (test == 5) {
    textcheck = 'Your pet is perfectly healty!';
  } else if (test == 3) {
    textcheck = 'Your pet needs to work out!';
  } else if (test == 4) {
    textcheck = 'Your pet need to walk more!';
  }
  return textcheck;
}

class home_2 extends StatefulWidget {
  @override
  State<home_2> createState() => _home_2State();
}

// var heartRate = Random().nextDouble() * 10;
// var calories = Random().nextDouble() * 4;
// var workoutMinutes = Random().nextDouble() * 1;
String? _currentLoginDate;

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
          backgroundColor: Color(0xffabdbe3),
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
                icon: const Icon(Icons.privacy_tip, color: Color(0xff154c79)),
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
                  var heartRate_week = userData.heart;
                  var heartRate = double.parse(heartRate_week?[0]);
                  var calories_week = userData.calories;
                  var calories = double.parse(calories_week?[0]);
                  var workoutMinutes_week = userData.workout;
                  var workoutMinutes = double.parse(workoutMinutes_week?[0]);
                  var step_week = userData.step;
                  var step = double.parse(step_week?[0]);
                  double percentageCompletion = (1 -
                          (algorithm_bar(
                              heartRate, calories, workoutMinutes, step))) *
                      100;

                  int test =
                      algorithm(heartRate, calories, workoutMinutes, step);
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
                                  color: const Color(0xff76b5c5),
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
                                        (algorithm_bar(heartRate, calories,
                                            workoutMinutes, step))),
                                    progressColor: const Color(0xff1e81b0),
                                    backgroundColor: const Color(0xffabdbe3),
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
