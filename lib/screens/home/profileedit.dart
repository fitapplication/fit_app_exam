import 'package:fit_app_exam/screens/home/home_2.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fit_app_exam/models/pet.dart';
import 'package:fit_app_exam/models/user.dart';
import 'package:fit_app_exam/screens/home/pet_list.dart';
import 'package:fit_app_exam/screens/home/setting_form.dart';
import 'package:fit_app_exam/screens/strings.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/services/database.dart';
import 'package:fit_app_exam/shared/constants.dart';
import 'package:fit_app_exam/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String error = '';
  String? _currentName;
  String? _currentSurname;
  String? _currentAge;
  String? _currentHeigth;
  String? _currentWeigth;
  String? _currentNickname;
  String? _currentUserID;
  List? _currentStep;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Username>(context);
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('PetFit'),
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            body: StreamBuilder<UserData>(
                stream: DatabaseService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserData? userData = snapshot.data;
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          const Text(
                            'Update your profile',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          const SizedBox(height: 20),
                          Text('Nickname Pet:'),
                          TextFormField(
                            initialValue: userData!.nickname,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Nickname Pet'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a nickname' : null,
                            onChanged: (val) =>
                                setState(() => _currentNickname = val),
                          ),
                          Text('Name:'),
                          TextFormField(
                            initialValue: userData.name,
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Name'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a name' : null,
                            onChanged: (val) =>
                                setState(() => _currentName = val),
                          ),
                          Text('Surname:'),
                          TextFormField(
                            initialValue: userData.surname,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Surname'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a surname' : null,
                            onChanged: (val) =>
                                setState(() => _currentSurname = val),
                          ),
                          Text('Age:'),
                          TextFormField(
                            initialValue: userData.age,
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Age'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a age' : null,
                            onChanged: (val) =>
                                setState(() => _currentAge = val),
                          ),
                          Text('Height:'),
                          TextFormField(
                            initialValue: userData.heigth,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Heigth [cm]'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a heigth' : null,
                            onChanged: (val) =>
                                setState(() => _currentHeigth = val),
                          ),
                          Text('Weight:'),
                          TextFormField(
                            initialValue: userData.weigth,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Weigth [kg]'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a weigth' : null,
                            onChanged: (val) =>
                                setState(() => _currentWeigth = val),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              RaisedButton(
                                  color: Colors.pink,
                                  child: const Text('Update',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await DatabaseService(uid: user.uid)
                                          .updateUserData(
                                        _currentName ?? userData.name!,
                                        _currentSurname ?? userData.surname!,
                                        _currentAge ?? userData.age!,
                                        _currentWeigth ?? userData.weigth!,
                                        _currentHeigth ?? userData.heigth!,
                                        _currentNickname ?? userData.nickname!,
                                        _currentUserID ?? userData.userID!,
                                        _currentStep ?? userData.step!,
                                      );
                                    }

                                    Navigator.pop(context);
                                  }),

                              //register fitbit
                              RaisedButton(
                                  color: Colors.pink,
                                  child: const Text('Fitbit Login',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    String? userId =
                                        await FitbitConnector.authorize(
                                            context: context,
                                            clientID: Strings.fitbitClientID,
                                            clientSecret:
                                                Strings.fitbitClientSecret,
                                            redirectUri:
                                                Strings.fitbitRedirectUri,
                                            callbackUrlScheme:
                                                Strings.fitbitCallbackScheme);
                                    _currentUserID = userId;
                                    await FitbitConnector.storage
                                        .read(key: 'fitbitAccessToken');
                                    await FitbitConnector.storage
                                        .read(key: 'fitbitRefreshToken');

                                    //Instantiate a proper data manager
                                    FitbitActivityTimeseriesDataManager
                                        fitbitActivityTimeseriesDataManager =
                                        FitbitActivityTimeseriesDataManager(
                                      clientID: Strings.fitbitClientID,
                                      clientSecret: Strings.fitbitClientSecret,
                                      type: 'steps',
                                    );

                                    //Fetch data
                                    String? test;

                                    List<FitbitActivityTimeseriesData>?
                                        stepData;
                                    for (var i = 0; i < 30; i++) {
                                      stepData =
                                          await fitbitActivityTimeseriesDataManager
                                              .fetch(
                                                  FitbitActivityTimeseriesAPIURL
                                                      .dayWithResource(
                                        date: DateTime.now()
                                            .subtract(Duration(days: i)),
                                        userID: userId,
                                        resource:
                                            fitbitActivityTimeseriesDataManager
                                                .type,
                                      )) as List<FitbitActivityTimeseriesData>;
                                      print(stepData);
                                      var stepsinfo =
                                          stepData.toString().split(': ');
                                      String K =
                                          stepsinfo[stepsinfo.length - 1];
                                      var stepday = K.split(',');
                                      print(stepday[0]);

                                      test = '$test,${stepday[0]}';
                                    }

                                    print(test);

                                    _currentStep = test.toString().split(',');
                                  })
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Loading();
                  }
                }));
  }
}
