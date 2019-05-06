import 'package:flutter/material.dart';
import 'dart:math';

class Calculation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new CalculationState();
  }
}

class CalculationState extends State<Calculation>{
  int _counter = 0;

  // Adds a random amount to the counter
  void _rndNumber(){
    Random rnd = new Random();
    int min = 50;
    int max = 200;
    setState((){
      _counter = _counter + (min + rnd.nextInt(max - min));
    });
  }

  // Adds 100 to the counter
  void _changeNumber(){
    setState((){
      _counter = _counter + 100;
    });
  }
  // Resets the counter
  void _reset(){
    setState((){
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Just adding Numbers"),
        backgroundColor: Colors.lightBlue,
      ),
      body: new Container(
        color: Colors.white70,
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(" Tap the Buttons! ",
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new Text("Number: ${_counter}",
                  style: new TextStyle(
                      color:  _counter > 2000 ? Colors.greenAccent : Colors.redAccent,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800
                  )
                )
              )
            ),
            new Container(
              child: new Center(
                child: new FlatButton(
                  color: Colors.lightBlueAccent,
                  onPressed: _changeNumber,
                  child: new Text("+ 100",
                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ),
            new Container(
              child: new Center(
                child: new FlatButton(
                  color: Colors.redAccent,
                    onPressed: _reset,
                    child: new Text("Reset",
                      style: new TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                ),
              )
            ),
            new Container(
                child: new Center(
                  child: new FlatButton(
                    color: Colors.greenAccent,
                    onPressed: _rndNumber,
                    child: new Text("Lucky",
                      style: new TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            )
    ],
        ),
      ),
    );
  }
}
