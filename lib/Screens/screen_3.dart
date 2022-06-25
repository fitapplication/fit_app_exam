import 'package:flutter/material.dart';

class Recap extends StatelessWidget {
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
            title: const Text("Shop"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1599663096715-ef083b396543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2825&q=80"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text("Go Premium!",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text("Reward: step multiplier + bonus steps on buy",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15)),
                  Icon(Icons.shopping_cart,
                      color: Colors.indigo[900], size: 70.0),
                  ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () => {
                      null,
                    },
                    child: const Text("Remove ads on your buy!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  )
                ]))));
  }
}