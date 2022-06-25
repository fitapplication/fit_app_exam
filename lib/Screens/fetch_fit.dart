import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';

import '../Screens/strings.dart';
import 'package:fit_app_exam/Screens/homescreen.dart';

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
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                  date: DateTime.now().subtract(Duration(days: 0)),
                  userID: userId,
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
                print(stepsData);
                // Use them as you want
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
