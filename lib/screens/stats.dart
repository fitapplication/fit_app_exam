import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fit_app_exam/screens/strings.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/services/database.dart';
import 'package:fit_app_exam/shared/constants.dart';
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
// int stepsCount = Random().nextInt(20000);
// int caloriesBurnt = Random().nextInt(3500);

// class Graphs extends StatefulWidget {
//   @override
//   State<Graphs> createState() => Dynamic();
// }

class Fetch extends State<Graphs> {
  final List<BarChartModel> data_steps = [
    BarChartModel('1', Random().nextInt(20000), Colors.blue),
    BarChartModel('2', Random().nextInt(20000), Colors.red),
    BarChartModel('3', Random().nextInt(20000), Colors.yellow),
    BarChartModel('4', Random().nextInt(20000), Colors.brown),
    BarChartModel('5', Random().nextInt(20000), Colors.indigo),
    BarChartModel('6', Random().nextInt(20000), Colors.purple),
    BarChartModel('7', Random().nextInt(20000), Colors.orange),
  ];

  final List<BarChartModel> data_sleep = [
    BarChartModel('1', Random().nextInt(20000), Colors.blue),
    BarChartModel('2', Random().nextInt(20000), Colors.red),
    BarChartModel('3', Random().nextInt(20000), Colors.yellow),
    BarChartModel('4', Random().nextInt(20000), Colors.brown),
    BarChartModel('5', Random().nextInt(20000), Colors.indigo),
    BarChartModel('6', Random().nextInt(20000), Colors.purple),
    BarChartModel('7', Random().nextInt(20000), Colors.orange),
  ];
  final List<BarChartModel> data_calories = [
    BarChartModel('1', Random().nextInt(20000), Colors.blue),
    BarChartModel('2', Random().nextInt(20000), Colors.red),
    BarChartModel('3', Random().nextInt(20000), Colors.yellow),
    BarChartModel('4', Random().nextInt(20000), Colors.brown),
    BarChartModel('5', Random().nextInt(20000), Colors.indigo),
    BarChartModel('6', Random().nextInt(20000), Colors.purple),
    BarChartModel('7', Random().nextInt(20000), Colors.orange),
  ];
  final List<BarChartModel> data_workout = [
    BarChartModel('1', Random().nextInt(20000), Colors.blue),
    BarChartModel('2', Random().nextInt(20000), Colors.red),
    BarChartModel('3', Random().nextInt(20000), Colors.yellow),
    BarChartModel('4', Random().nextInt(20000), Colors.brown),
    BarChartModel('5', Random().nextInt(20000), Colors.indigo),
    BarChartModel('6', Random().nextInt(20000), Colors.purple),
    BarChartModel('7', Random().nextInt(20000), Colors.orange),
  ];

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
    // final AuthService _auth = AuthService();
    // final user = Provider.of<Username>(context);
    // List? _currentStep;
    List<charts.Series<BarChartModel, String>> series_steps = [
      charts.Series(
        id: "Steps",
        data: data_steps,
        domainFn: (BarChartModel series, _) => series.task,
        measureFn: (BarChartModel series, _) => series.value,
        colorFn: (BarChartModel series, _) =>
            charts.ColorUtil.fromDartColor(series.colorVal),
      ),
    ];
    List<charts.Series<BarChartModel, String>> series_sleep = [
      charts.Series(
        id: "Sleep",
        data: data_sleep,
        domainFn: (BarChartModel series, _) => series.task,
        measureFn: (BarChartModel series, _) => series.value,
        colorFn: (BarChartModel series, _) =>
            charts.ColorUtil.fromDartColor(series.colorVal),
      ),
    ];
    List<charts.Series<BarChartModel, String>> series_calories = [
      charts.Series(
        id: "Calories",
        data: data_calories,
        domainFn: (BarChartModel series, _) => series.task,
        measureFn: (BarChartModel series, _) => series.value,
        colorFn: (BarChartModel series, _) =>
            charts.ColorUtil.fromDartColor(series.colorVal),
      ),
    ];
    List<charts.Series<BarChartModel, String>> series_workout = [
      charts.Series(
        id: "Work out",
        data: data_workout,
        domainFn: (BarChartModel series, _) => series.task,
        measureFn: (BarChartModel series, _) => series.value,
        colorFn: (BarChartModel series, _) =>
            charts.ColorUtil.fromDartColor(series.colorVal),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          title: const Text("Graphs"),
          backgroundColor: Colors.lightBlue[200],
          centerTitle: true),
      body: Container(
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
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                    animationDuration: const Duration(seconds: 1),
                    behaviors: [
                      charts.ChartTitle('Days',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                      charts.ChartTitle('Steps counter',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                  child: Text(
                    'Sleep',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) -
                      ((MediaQuery.of(context).size.height) * 0.20),
                  child: charts.BarChart(
                    series_sleep,
                    animate: true,
                    animationDuration: const Duration(seconds: 1),
                    behaviors: [
                      charts.ChartTitle('Days',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                      charts.ChartTitle('Sleep Hours',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                  child: Text(
                    'Calories',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                    animationDuration: const Duration(seconds: 1),
                    behaviors: [
                      charts.ChartTitle('Days',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                      charts.ChartTitle('Calories burnt',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                  child: Text(
                    'Work out',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                    animationDuration: const Duration(seconds: 1),
                    behaviors: [
                      charts.ChartTitle('Days',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                      charts.ChartTitle('Work out hours',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
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
      ),
    );
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
