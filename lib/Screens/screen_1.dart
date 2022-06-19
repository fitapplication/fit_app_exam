import 'package:flutter/material.dart';

int test = 1;

String check(int test) {
  String imagecheck = '';

  if (test == 1) {
    imagecheck = "https://c.tenor.com/OTiUFg5Z2coAAAAC/pusheen-play.gif";
  } else if (test == 2) {
    imagecheck = "https://c.tenor.com/MVwqWHzPXNwAAAAC/pusheen-goodnight.gif";
  } else if (test == 3) {
    imagecheck = 'https://c.tenor.com/sJnOE_eYvFcAAAAC/pusheen.gif';
  }
  return imagecheck;
}

String checktext(int test) {
  String textcheck = '';
  if (test == 1) {
    textcheck = 'Your pet needs more execise!';
  } else if (test == 2) {
    textcheck = 'Your pet needs more sleep!';
  } else if (test == 3) {
    textcheck = 'Your pet is perfectly healty!';
  }
  return textcheck;
}

class Tamagotchi extends StatelessWidget {
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepOrange,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Your Pet"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Expanded(
                  flex: 70,
                  child: Container(
                    // width: MediaQuery.of(context).size.width *0.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(check(test)), fit: BoxFit.cover),
                      border: Border.all(
                        color: const Color.fromARGB(255, 185, 19, 19),
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    margin: const EdgeInsets.all(10.0),
                  )),
              Expanded(
                  flex: 50,
                  child: Container(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        const Text("Nome Pet",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                        Text(checktext(test),
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30)),
                        Icon(Icons.ramen_dining_rounded,
                            color: Colors.indigo[900], size: 100.0),
                      ])))
            ])));
  }
}
