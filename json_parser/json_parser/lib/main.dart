/* LEARNING FLUTTER: JSON
 * From the Udemy course by Paulo Dichone
 *  Taking json data from:
 *  https://jsonplaceholder.typicode.com/posts
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJSON();
  /* The following two loops have been used for debugging
     purposes only
  // Printing the titles to the console with a for loop
  for (var i = 0; i < _data.length; i++){
    print("ID ${i+1}: ${_data[i]['title']}\n");
  }
  // Printing the data to the console with a for .. in loop
  int counter = 1;
  for (var element in _data){
    print('ID $counter: ${element['title']}\n');
    counter++;
  }*/
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Using JSON data"),
          backgroundColor: Colors.teal,
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(30.0),
          // The ListView Allows me to create a scrollable list
          // of elements.
          // In this case I am displaying them as a column and I am
          // including a Divider (not really necessary, but useful for
          // future reference) and a Card which gives a nice material-like
          // 3D effect.
          // For more about ListView and how to use Cards look here:
          // https://docs.flutter.io/flutter/material/ListTile-class.html
          // REMEMBER TO PASS itemCount and itemBuilder, and to return a Widget
          // (in this case Column, but it could be Row or another Widget):
          // ItemCount keeps the length of the list
          // ItemBuilder keeps track of the element in the list through
          // the second parameter, in this case 'pos' (any name will do).
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int pos){
              return Column(
                children: <Widget>[
                  Divider(
                    height: 8.0
                  ),
                  Card(
                    child: ListTile(
                      // Adding a Icon as the leading widget, another
                      // interesting option would be CircleAvatar
                      leading: Icon(Icons.chat_bubble_outline),
                      // Capitalizing the first letter of th Title
                      title: Text(_data[pos]["title"][0].toUpperCase() + _data[pos]["title"].substring(1),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        )
                      ),
                      // Capitalizing hte first letter of the Body
                      subtitle: Text(_data[pos]["body"][0].toUpperCase() + _data[pos]["body"].substring(1)),
                      onTap: () => showTapMsg(context, _data[pos]["id"]),
                    ),
                  ),
                ],
              );
              },
          ),
          ),
      ),
    ),
  );
}

// Creating an alert every time a Card id clicked
void showTapMsg(BuildContext context, int msg){
  var alertDialog = AlertDialog(
    title: Text('ID: ${msg.toString()}'),
    actions: <Widget>[

      FlatButton(
        // The Navigator knows everything about the view
        // with the method pop() it's going to remove the last
        // thing that we put out (it works like a stack, so you pop the
        // element
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.check,
            color: Colors.teal),
      )
    ]
  );
  
  showDialog(context: context, builder: (context){
    return alertDialog;
  });
  
}

// Future that expects a String value
Future<List> getJSON() async {
  String apiURL = 'https://jsonplaceholder.typicode.com/posts';

  http.Response response = await http.get(apiURL);

  return json.decode(response.body);

}