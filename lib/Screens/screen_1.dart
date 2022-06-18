import 'package:flutter/material.dart';

class Tamagotchi extends StatelessWidget {
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepOrange,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Mission log"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1632772998001-cc9bf6f7c852?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text("Daily goal",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text("Reward: +30 steps",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15)),
                  Icon(Icons.looks_one, color: Colors.indigo[900], size: 70.0),
                  ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () => {
                      null,
                    },
                    child: const Text(
                        "You are - n steps away from your daily goal",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  )
                ]))));
  }
}
