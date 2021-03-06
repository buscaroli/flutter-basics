// EXERCISE
// First Challenge from the Course on AppBrewery from Angela Yu
// Creating a Simple Layout
//
// Matteo

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 100,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        color: Colors.green,
                        height: 100,
                        width: 100,
                      ),
                    ]

                  )
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                ),
              ]
        )
        )
      ),
    );
  }
}

