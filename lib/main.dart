import 'package:flutter/material.dart';
import 'package:fit_app_exam/Screens/screen_1.dart';
import 'package:fit_app_exam/Screens/screen_2.dart';
import 'package:fit_app_exam/Screens/screen_3.dart';

void main() {
  runApp(MaterialApp(home: HomePage(), routes: <String, WidgetBuilder>{}));
}

// class Name extends StatefulWidget{
//   @override
//   HomePage createState() {
//     return HomePage();
//   }
// }

class HomePage extends StatelessWidget {
  // String result = "";

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    elevation: 50.0,
    onSurface: Colors.black.withOpacity(1),
    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  );
  // int steps=0;
  // int goal=1000000;
  // int daily_goal=8000;
  // void incrementCounter() {
  //   setState(() {
  //     steps++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Home"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: Container(
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage("https://images.unsplash.com/photo-1545132147-d037e6c54cfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBsYW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
          //         fit: BoxFit.cover)
          //     ),
          child: Stack(children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          style: elevatedButtonStyle,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Tamagotchi();
                            }));
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Tamagotchi",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25,
                                        color: Colors.white70)),
                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Icon(Icons.pets,
                                    color: Colors.white70, size: 50.0),
                              ])),
                      ElevatedButton(
                          style: elevatedButtonStyle,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Graphs();
                            }));
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Graphs",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25,
                                        color: Colors.white70)),
                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Icon(Icons.insert_chart_outlined_outlined,
                                    color: Colors.white70, size: 50.0),
                              ])),
                      ElevatedButton(
                          style: elevatedButtonStyle,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Recap();
                            }));
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Profile",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25,
                                        color: Colors.white70)),
                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Icon(Icons.person,
                                    color: Colors.white70, size: 50.0),
                              ])),
                    ]))
          ]),
        ));
  }
}
