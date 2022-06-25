import 'dart:ffi';

import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';

import '../Screens/strings.dart';
import 'package:fit_app_exam/Screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchFit extends StatelessWidget {
  FetchFit({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'FetchFit';

  @override
  Widget build(BuildContext context) {
    print('${FetchFit.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(FetchFit.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Authorize the app
                String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme);

                await FitbitConnector.storage.read(key: 'fitbitAccessToken');
                await FitbitConnector.storage.read(key: 'fitbitRefreshToken');

                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'steps',
                );

                //Fetch data
                var step_list = ['', '', '', '', '', '', ''];
                SharedPreferences sp = await SharedPreferences.getInstance();
                for (var i = 0; i < 7; i++) {
                  final stepsData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                    date: DateTime.now().subtract(Duration(days: i)),
                    userID: userId,
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;

                  var steps_info = stepsData.toString().split(':');
                  String K = steps_info[6];
                  var step_day = K.split(',');

                  step_list[i] = step_day[0];
                }
                await sp.setStringList('step', step_list);
                print(step_list);
              },
              child: Text('Tap to authorize'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: Text('Go to App'),
            ),
          ],
        ),
      ),
    );
  } //build

} //HomePage
