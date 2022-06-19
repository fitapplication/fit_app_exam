import 'package:flutter/material.dart';
import 'package:fit_app_exam/Screens/screen_1.dart';
import 'package:fit_app_exam/Screens/screen_2.dart';
import 'package:fit_app_exam/Screens/screen_3.dart';

void main() {
  runApp(MaterialApp(home: HomePage(), routes: <String, WidgetBuilder>{}));
  theme:
  new ThemeData(scaffoldBackgroundColor: const Color(0xffe4dad0));
}

// class Name extends StatefulWidget{
//   @override
//   HomePage createState() {
//     return HomePage();
//   }
// }

class HomePage extends StatelessWidget {
  // String result = "";

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
            title: const Text("Hi User!"),
            backgroundColor: Color(0xffd6d6d6),
            centerTitle: false),
        body: Container(
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage("https://images.unsplash.com/photo-1545132147-d037e6c54cfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBsYW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
          //         fit: BoxFit.cover)
          //     ),
          child: Stack(children: <Widget>[
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff4dc590),
                            elevation: 50.0,
                            minimumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            maximumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            onSurface: Colors.black.withOpacity(1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 40.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Tamagotchi();
                            }));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Tamagotchi",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        color: Colors.white70)),

                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Icon(Icons.pets,
                                    color: Colors.white70, size: 50.0),
                              ])),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff65a4d9),
                            elevation: 50.0,
                            minimumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            maximumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            onSurface: Colors.black.withOpacity(1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 40.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Graphs();
                            }));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Graphs",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        color: Colors.white70)),
                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Icon(Icons.insert_chart_outlined_outlined,
                                    color: Colors.white70, size: 50.0),
                              ])),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfff37145),
                            elevation: 50.0,
                            minimumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            maximumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            onSurface: Colors.black.withOpacity(1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 40.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Recap();
                            }));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Profile",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        color: Colors.white70)),
                                Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                  size: 50.0,
                                ),
                              ])),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfff4d793),
                            elevation: 50.0,
                            minimumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            maximumSize: Size(
                                MediaQuery.of(context).size.height / 1.9,
                                MediaQuery.of(context).size.width / 3.1),
                            onSurface: Colors.black.withOpacity(1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 40.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Graphs();
                            }));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Settings",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        color: Colors.white70)),
                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Icon(Icons.settings,
                                    color: Colors.white70, size: 50.0),
                              ])),
                    ]))
          ]),
        ));
  }
}
