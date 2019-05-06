import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First Stateful Widget App"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.send),
            onPressed: null,
          )
        ],
      ),
      backgroundColor: Colors.black38,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("First Child",
              style: new TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.yellowAccent,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items:
        [new BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text("Add")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.remove),
              title: new Text("Remove")),
        ],
        onTap: null,
      ),
    );
  }
}
