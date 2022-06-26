import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fit_app_exam/screens/strings.dart';
import 'dart:math';
import 'package:flutter/material.dart';

var sleepHours = Random().nextDouble() * 10;
var exerciceHours = Random().nextDouble() * 4;
int stepsCount = Random().nextInt(20000);
int caloriesBurnt = Random().nextInt(3500);

// class Graphs extends StatefulWidget {
//   @override
//   State<Graphs> createState() => Dynamic();
// }

class Graphs extends StatelessWidget {
  final List<BarChartModel> data = [
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
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Steps",
        data: data,
        domainFn: (BarChartModel series, _) => series.task,
        measureFn: (BarChartModel series, _) => series.value,
        colorFn: (BarChartModel series, _) =>
            charts.ColorUtil.fromDartColor(series.colorVal),
      )
    ];
    return Scaffold(
      appBar: AppBar(
          title: const Text("Graphs"),
          backgroundColor: Colors.lightBlue[200],
          centerTitle: true),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Expanded(
              flex: 70,
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                child: charts.BarChart(
                  series,
                  animate: true,
                  animationDuration: const Duration(seconds: 1),
                  behaviors: [
                    charts.ChartTitle('Days',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
                    charts.ChartTitle('Steps',
                        behaviorPosition: charts.BehaviorPosition.start,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
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
          ])),
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
    );
  }
}

class BarChartModel {
  String task = '';
  int value = 0;
  Color colorVal = const Color.fromARGB(0, 254, 0, 0);

  BarChartModel(this.task, this.value, this.colorVal);
}
