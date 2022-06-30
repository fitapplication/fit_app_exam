import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/services/database.dart';
import 'package:fit_app_exam/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:fit_app_exam/models/user.dart';

class Graphs extends StatefulWidget {
  const Graphs({Key? key}) : super(key: key);
  @override
  State<Graphs> createState() => Fetch();
}

// var sleepHours = Random().nextDouble() * 10;
// var exerciceHours = Random().nextDouble() * 4;
// int stepsCount = double.parse(step_list_7?[1]);
// int caloriesBurnt = Random().nextInt(3500);

// class Graphs extends StatefulWidget {
//   @override
//   State<Graphs> createState() => Dynamic();
// }

class Fetch extends State<Graphs> {
  // late TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   // _tabController = TabController(vsync: this, length: 1);
  //   _seriesPieData;
  //   _generateData();
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<Username>(context);

    return Scaffold(
        appBar: AppBar(
            title: const Text("Graphs"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData? userData = snapshot.data;
                var step_list_7 = userData?.step;
                var calories_list_7 = userData?.calories;

                var heart_list_7 = userData?.heart;

                var workout_list_7 = userData?.workout;
                final List<BarChartModel> data_steps = [
                  BarChartModel('Today', double.parse(step_list_7?[0]).round(),
                      Colors.blue),
                  BarChartModel('1 day ago',
                      double.parse(step_list_7?[1]).round(), Colors.red),
                  BarChartModel('2 days ago',
                      double.parse(step_list_7?[2]).round(), Colors.yellow),
                  BarChartModel('3 days ago',
                      double.parse(step_list_7?[3]).round(), Colors.brown),
                  BarChartModel('4 days ago',
                      double.parse(step_list_7?[4]).round(), Colors.indigo),
                  BarChartModel('5 days ago',
                      double.parse(step_list_7?[5]).round(), Colors.purple),
                  BarChartModel('6 days ago',
                      double.parse(step_list_7?[6]).round(), Colors.orange),
                ];

                final List<BarChartModel> data_calories = [
                  BarChartModel('Today',
                      double.parse(calories_list_7?[0]).round(), Colors.blue),
                  BarChartModel('1 day ago',
                      double.parse(calories_list_7?[1]).round(), Colors.red),
                  BarChartModel('2 days ago',
                      double.parse(calories_list_7?[2]).round(), Colors.yellow),
                  BarChartModel('3 days ago',
                      double.parse(calories_list_7?[3]).round(), Colors.brown),
                  BarChartModel('4 days ago',
                      double.parse(calories_list_7?[4]).round(), Colors.indigo),
                  BarChartModel('5 days ago',
                      double.parse(calories_list_7?[5]).round(), Colors.purple),
                  BarChartModel('6 days ago',
                      double.parse(calories_list_7?[6]).round(), Colors.orange),
                ];
                final List<BarChartModel> data_heart = [
                  BarChartModel('Today', double.parse(heart_list_7?[0]).round(),
                      Colors.blue),
                  BarChartModel('1 day ago',
                      double.parse(heart_list_7?[1]).round(), Colors.red),
                  BarChartModel('2 days ago',
                      double.parse(heart_list_7?[2]).round(), Colors.yellow),
                  BarChartModel('3 days ago',
                      double.parse(heart_list_7?[3]).round(), Colors.brown),
                  BarChartModel('4 days ago',
                      double.parse(heart_list_7?[4]).round(), Colors.indigo),
                  BarChartModel('5 days ago',
                      double.parse(heart_list_7?[5]).round(), Colors.purple),
                  BarChartModel('6 days ago',
                      double.parse(heart_list_7?[6]).round(), Colors.orange),
                ];
                final List<BarChartModel> data_workout = [
                  BarChartModel('Today',
                      double.parse(workout_list_7?[0]).round(), Colors.blue),
                  BarChartModel('1 day ago',
                      double.parse(workout_list_7?[1]).round(), Colors.red),
                  BarChartModel('2 days ago',
                      double.parse(workout_list_7?[2]).round(), Colors.yellow),
                  BarChartModel('3 days ago',
                      double.parse(workout_list_7?[3]).round(), Colors.brown),
                  BarChartModel('4 days ago',
                      double.parse(workout_list_7?[4]).round(), Colors.indigo),
                  BarChartModel('5 days ago',
                      double.parse(workout_list_7?[5]).round(), Colors.purple),
                  BarChartModel('6 days ago',
                      double.parse(workout_list_7?[6]).round(), Colors.orange),
                ];
                // List? _currentStep;
                List<charts.Series<BarChartModel, String>> series_steps = [
                  charts.Series(
                    labelAccessorFn: (BarChartModel series, _) =>
                        '${series.value.toString()}',
                    insideLabelStyleAccessorFn: (BarChartModel series, _) {
                      return charts.TextStyleSpec(fontSize: 15);
                    },
                    id: "Steps",
                    data: data_steps,
                    domainFn: (BarChartModel series, _) => series.task,
                    measureFn: (BarChartModel series, _) => series.value,
                    colorFn: (BarChartModel series, _) =>
                        charts.ColorUtil.fromDartColor(series.colorVal),
                  ),
                ];
                List<charts.Series<BarChartModel, String>> series_calories = [
                  charts.Series(
                    labelAccessorFn: (BarChartModel series, _) =>
                        '${series.value.toString()}',
                    insideLabelStyleAccessorFn: (BarChartModel series, _) {
                      return charts.TextStyleSpec(fontSize: 15);
                    },
                    id: "Calories",
                    data: data_calories,
                    domainFn: (BarChartModel series, _) => series.task,
                    measureFn: (BarChartModel series, _) => series.value,
                    colorFn: (BarChartModel series, _) =>
                        charts.ColorUtil.fromDartColor(series.colorVal),
                  ),
                ];
                List<charts.Series<BarChartModel, String>> series_heart = [
                  charts.Series(
                    labelAccessorFn: (BarChartModel series, _) =>
                        '${series.value.toString()}',
                    insideLabelStyleAccessorFn: (BarChartModel series, _) {
                      return charts.TextStyleSpec(fontSize: 15);
                    },
                    id: "Heart Resting State",
                    data: data_heart,
                    domainFn: (BarChartModel series, _) => series.task,
                    measureFn: (BarChartModel series, _) => series.value,
                    colorFn: (BarChartModel series, _) =>
                        charts.ColorUtil.fromDartColor(series.colorVal),
                  ),
                ];

                List<charts.Series<BarChartModel, String>> series_workout = [
                  charts.Series(
                    labelAccessorFn: (BarChartModel series, _) =>
                        '${series.value.toString()}',
                    insideLabelStyleAccessorFn: (BarChartModel series, _) {
                      return charts.TextStyleSpec(fontSize: 15);
                    },
                    id: "Work out",
                    data: data_workout,
                    domainFn: (BarChartModel series, _) => series.task,
                    measureFn: (BarChartModel series, _) => series.value,
                    colorFn: (BarChartModel series, _) =>
                        charts.ColorUtil.fromDartColor(series.colorVal),
                  ),
                ];
                return Container(
                  height: ((MediaQuery.of(context).size.height) * 3) +
                      10 -
                      ((MediaQuery.of(context).size.height) * 0.80),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10.0,
                          ),
                          const SizedBox(
                            height: 60.0,
                            child: Text(
                              'Steps',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: (MediaQuery.of(context).size.height) -
                                ((MediaQuery.of(context).size.height) * 0.20),
                            child: charts.BarChart(
                              series_steps,
                              animate: true,
                              barRendererDecorator:
                                  charts.BarLabelDecorator<String>(),
                              vertical: false,
                              animationDuration: const Duration(seconds: 1),
                              behaviors: [
                                charts.ChartTitle('Steps counter',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                charts.ChartTitle('Days',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                            child: Text(
                              'Calories',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: (MediaQuery.of(context).size.height) -
                                ((MediaQuery.of(context).size.height) * 0.20),
                            child: charts.BarChart(
                              series_calories,
                              animate: true,
                              barRendererDecorator:
                                  charts.BarLabelDecorator<String>(),
                              vertical: false,
                              animationDuration: const Duration(seconds: 1),
                              behaviors: [
                                charts.ChartTitle('Calories Burnt',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                charts.ChartTitle('Days',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                            child: Text(
                              'Heart Resting State',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: (MediaQuery.of(context).size.height) -
                                ((MediaQuery.of(context).size.height) * 0.20),
                            child: charts.BarChart(
                              series_heart,
                              animate: true,
                              barRendererDecorator:
                                  charts.BarLabelDecorator<String>(),
                              vertical: false,
                              animationDuration: const Duration(seconds: 1),
                              behaviors: [
                                charts.ChartTitle('Heart Resting State',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                charts.ChartTitle('Days',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                            child: Text(
                              'Work out',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: (MediaQuery.of(context).size.height) -
                                ((MediaQuery.of(context).size.height) * 0.20),
                            child: charts.BarChart(
                              series_workout,
                              animate: true,
                              barRendererDecorator:
                                  charts.BarLabelDecorator<String>(),
                              vertical: false,
                              animationDuration: const Duration(seconds: 1),
                              behaviors: [
                                charts.ChartTitle('Work out minutes',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                charts.ChartTitle('Days',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.outside),
                      // primaryMeasureAxis: const charts.NumericAxisSpec(
                      //     renderSpec: charts.GridlineRendererSpec()),
                      // domainAxis: const charts.OrdinalAxisSpec(
                      //     showAxisLine: true,
                      //     renderSpec: charts.NoneRenderSpec())
                    ),
                  ),
                );
              } else {
                return Loading();
              }
            }));
//               Expanded(
//                   flex: 50,
//                   child: Container(
//                       child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                         const Text("Nome Pet",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 40)),
//                         Text(checktext(test),
//                             textAlign: TextAlign.left,
//                             style: TextStyle(fontSize: 30)),
//                         Icon(Icons.ramen_dining_rounded,
//                             color: Colors.indigo[900], size: 100.0),
//                       ])))
  }
}

class BarChartModel {
  String task = '';
  int value = 0;
  Color colorVal = const Color.fromARGB(0, 254, 0, 0);

  BarChartModel(this.task, this.value, this.colorVal);
}
