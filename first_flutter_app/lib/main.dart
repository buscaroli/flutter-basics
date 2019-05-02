// FIRST APP IN FLUTTER: HELLO WORLD

import 'package:flutter/material.dart';

void main(){
  runApp(
    new Material(
      color: Colors.greenAccent,
      child: new Center(
          child: new Text(
              "Hello World",
              textDirection: TextDirection.ltr,
              textScaleFactor: 3,
              style: new TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
            ),
          ),
      )
    )
  );
}