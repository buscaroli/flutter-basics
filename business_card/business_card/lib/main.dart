// EXERCISE
// Challenge from the AppBrewery Course made by Angela Yu.
//
// Create a Single-page App that display your data as in
// a Business Card.
//
// Matteo

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                Text(
                  'Matteo',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontSize: 48,
                    letterSpacing: 4.0,
                    fontWeight: FontWeight.w700,
                ),
                ),
                Text(
                  'DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.teal.shade200,
                    fontSize: 22,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: Divider(
                    color: Colors.teal.shade50,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ListTile(
                    leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                    ),
                    title: Text(
                        '(+44) 744-15436784',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'the-email@example.co.uk',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                  ],
                  )

            ),
        ),
      );
  }
}
