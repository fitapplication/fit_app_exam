import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_exam/models/user.dart';
import 'package:fit_app_exam/screens/strings.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/services/database.dart';
import 'package:fit_app_exam/shared/constants.dart';
import 'package:fit_app_exam/shared/loading.dart';
import 'package:provider/provider.dart';

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
  String? _currentLoginDate;
  List? _currentStep;
  List? _currentCalories;
  List? _currentWorkout;
  List? _currentSleep;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Username>(context);
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('PetFit'),
              backgroundColor: Color(0XFF1e665b),
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
                      child: SingleChildScrollView(
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
                          Center(
                            child: Column(
                              children: [
                                RaisedButton(
                                    color: Color(0XFF1e665b),
                                    child: const Text('Update',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        await DatabaseService(uid: user.uid)
                                            .updateUserData(
                                                _currentName ?? userData.name!,
                                                _currentSurname ??
                                                    userData.surname!,
                                                _currentAge ?? userData.age!,
                                                _currentWeigth ??
                                                    userData.weigth!,
                                                _currentHeigth ??
                                                    userData.heigth!,
                                                _currentNickname ??
                                                    userData.nickname!,
                                                _currentUserID ??
                                                    userData.userID!,
                                                _currentLoginDate ??
                                                    userData.loginDate!,
                                                _currentStep ?? userData.step!,
                                                _currentCalories ??
                                                    userData.calories!,
                                                _currentWorkout ??
                                                    userData.workout!,
                                                _currentSleep ??
                                                    userData.sleep!);
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }),

                                //register fitbit
                                RaisedButton(
                                    color: Color(0XFF1e665b),
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
                                          fitbitActivityTimeseriesDataManagerSteps =
                                          FitbitActivityTimeseriesDataManager(
                                        clientID: Strings.fitbitClientID,
                                        clientSecret:
                                            Strings.fitbitClientSecret,
                                        type: 'steps',
                                      );
                                      FitbitActivityTimeseriesDataManager
                                          fitbitActivityTimeseriesDataManagerCalories =
                                          FitbitActivityTimeseriesDataManager(
                                        clientID: Strings.fitbitClientID,
                                        clientSecret:
                                            Strings.fitbitClientSecret,
                                        type: 'calories',
                                      );

                                      //Fetch data
                                      List<String> stepvalue = [];
                                      List<String> caloriesvalue = [];
                                      for (var i = 0; i < 7; i++) {
                                        List<FitbitActivityTimeseriesData>?
                                            stepData =
                                            await fitbitActivityTimeseriesDataManagerSteps
                                                .fetch(
                                                    FitbitActivityTimeseriesAPIURL
                                                        .dayWithResource(
                                          date: DateTime.now()
                                              .subtract(Duration(days: i)),
                                          userID: userId,
                                          resource:
                                              fitbitActivityTimeseriesDataManagerSteps
                                                  .type,
                                        )) as List<
                                                FitbitActivityTimeseriesData>;
                                        //print(stepData);
                                        var stepsinfo =
                                            stepData.toString().split(': ');
                                        String K =
                                            stepsinfo[stepsinfo.length - 1];
                                        var stepday = K.split(',');
                                        //print(stepday[0]);

                                        stepvalue.add(stepday[0]);

                                        List<FitbitActivityTimeseriesData>?
                                            caloriesData =
                                            await fitbitActivityTimeseriesDataManagerCalories
                                                .fetch(
                                                    FitbitActivityTimeseriesAPIURL
                                                        .dayWithResource(
                                          date: DateTime.now()
                                              .subtract(Duration(days: i)),
                                          userID: userId,
                                          resource:
                                              fitbitActivityTimeseriesDataManagerCalories
                                                  .type,
                                        )) as List<
                                                FitbitActivityTimeseriesData>;
                                        //print(stepData);
                                        var caloriesinfo =
                                            caloriesData.toString().split(': ');
                                        String F = caloriesinfo[
                                            caloriesinfo.length - 1];
                                        var caloriesday = F.split(',');
                                        //print(stepday[0]);

                                        caloriesvalue.add(caloriesday[0]);
                                      }

                                      //print(test);
                                      setState(() {
                                        loading = false;
                                      });

                                      _currentStep = stepvalue;
                                      _currentCalories = caloriesvalue;
                                    })
                              ],
                            ),
                          )
                        ],
                      )),
                    );
                  } else {
                    return Loading();
                  }
                }));
  }
}
