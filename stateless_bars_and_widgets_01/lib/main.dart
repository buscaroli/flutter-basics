// LEARNING FLUTTER
//  Scaffold and InkWell - basics
// Home should be moved to a separate folder under ./lib
// but decided to leave it here as this is for training purposes
// and it's more helpful to see all the code in one page

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  color: Colors.teal,
  title: "Bars and Buttons",
  home: new Home(),
));

class Home extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amberAccent,
        title: new Text("AppBar with Yellow Color"),
        actions: <Widget> [
          new IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
          ),
          new IconButton(
            icon: Icon(Icons.remove),
            onPressed: null,
          )
        ],
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Loom, by LucasArts",
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                color: Colors.blueAccent,
              ),
            ),
            new InkWell(
              child:
              new Text("Destiny Sall Draw the Lightning down from Heaven"),
              borderRadius: BorderRadius.circular(6.0),
              onTap: () => null,
            ),
            new InkWell(
              child:
                new Text("Roll its Thunder far across the Sea"),
                  onTap: () => null,
            ),
            new InkWell(
                child:
                new Text("To where I wait, upon the Shore of Wonders"),
                onTap: () => null,
            ),
            new InkWell(
                child:
                new Text("On the day the Sky is open"),
                onTap: () => null,
            ),
            new InkWell(
                child:
                new Text("And the Tree is split asunder"),
                onTap: () => null,
            )
          ]
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('Call')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('Mail')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add')),
        ],
          onTap: (int i) => debugPrint("Tapped ${i}"),
      ),
    );
  }
}
