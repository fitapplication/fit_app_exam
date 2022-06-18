import 'package:flutter/material.dart';

class Graphs extends StatelessWidget {
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
            title: const Text("All Time Statistics"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2076&q=80"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text("Total steps",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text("Total sleep hours",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15)),
                  Icon(Icons.flight, color: Colors.indigo[900], size: 70.0),
                  ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () => {
                      null,
                    },
                    child: const Text(
                        "You have travelled n times around the world",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  )
                ]))));
  }
}
