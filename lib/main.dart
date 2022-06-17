import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage(), routes: <String, WidgetBuilder>{
    "/MissionPage": (BuildContext context) => MissionPage(),
    "/StatsPage": (BuildContext context) => StatsPage(),
    "/FriendsPage": (BuildContext context) => FriendsPage(),
    "/PremiumPage": (BuildContext context) => PremiumPage(),
  }));
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
      borderRadius: BorderRadius.all(Radius.circular(10)),
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1545132147-d037e6c54cfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBsYW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                    fit: BoxFit.cover)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 20,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // new TextField(
                          //   decoration: new InputDecoration(
                          //     hintText: "Type your name here!"
                          //   ),
                          //   onSubmitted: (String str) {
                          //     setState(() {
                          //       result = str;
                          //     });
                          //   }
                          // ),

                          ElevatedButton(
                              style: elevatedButtonStyle,
                              onPressed: null,
                              child: Column(children: const [
                                Text("Hi Gabriele!",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        color: Colors.white70)),
                                // new Text("Steps Counter", textAlign: TextAlign.left, style: const TextStyle(fontSize:15, color:Colors.amber)),
                                Text("You are - n steps away from your goal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white70)),
                                Icon(Icons.directions_walk,
                                    color: Colors.white70, size: 50.0),
                              ]))
                        ])),
                Positioned(
                    top: 220,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Mission log",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.white70)),
                          IconButton(
                              icon: const Icon(Icons.checklist,
                                  color: Colors.white70),
                              iconSize: 70.0,
                              onPressed: () {
                                Navigator.of(context).pushNamed("/MissionPage");
                              }),
                        ])),
                Positioned(
                    top: 340,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("All Time Statistics",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.white70)),
                          IconButton(
                              icon: const Icon(Icons.leaderboard,
                                  color: Colors.white70),
                              iconSize: 70.0,
                              onPressed: () {
                                Navigator.of(context).pushNamed("/StatsPage");
                              }),
                        ])),
                Positioned(
                    top: 460,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Go Premium!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.white70)),
                          IconButton(
                              icon: const Icon(Icons.workspace_premium,
                                  color: Colors.white70),
                              iconSize: 70.0,
                              onPressed: () {
                                Navigator.of(context).pushNamed("/PremiumPage");
                              }),
                        ])),
                Positioned(
                    top: 580,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Friends log",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.white70)),
                          IconButton(
                              icon: const Icon(Icons.people_alt,
                                  color: Colors.white70),
                              iconSize: 70.0,
                              onPressed: () {
                                Navigator.of(context).pushNamed("/FriendsPage");
                              }),
                        ])),
              ],
            )));
  }
}

class MissionPage extends StatelessWidget {
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

class StatsPage extends StatelessWidget {
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

class PremiumPage extends StatelessWidget {
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

class FriendsPage extends StatelessWidget {
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
            title: const Text("Friend log"),
            backgroundColor: Colors.lightBlue[200],
            centerTitle: true),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1548705085-101177834f47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2832&q=80"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text("You are --- among your friends!",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const Text("Keep up!",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15)),
                  Icon(Icons.group_add, color: Colors.indigo[900], size: 70.0),
                  ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () => {
                      null,
                    },
                    child: const Text("Add a friend",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  )
                ]))));
  }
}
