// LEARNING FLUTTER: List of EarthQuakes
//
// Based on the Udemy Course from Paulo Dichone
//
// Matteo Buscaroli

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

// Declaring 2 global variables as need to access them
// within a different class
Map _data;
List _features;
void main() async {
  _data = await getJSON();
  _features = _data['features'];
  runApp (MaterialApp(
    title: 'Earthquakes',
    home: Home(),
  ));

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earthquakes'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _features.length,
          padding: EdgeInsets.all(10.0),
          itemBuilder: (BuildContext context, int pos){

            if (pos.isOdd) return Divider();
            final index = pos ~/ 2;
            // multiplying by 1000 to convert microseconds  to ms
            var format = DateFormat('EEE d MMM y,  hh:mm a');
            var date = format.format(DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time']*1000));

            return ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 28.0,
                  child: Text('${_features[index]['properties']['mag']}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    )),
              ),
              title: Text('$date',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red.shade800,
                )
              ),
              subtitle: Text('${_features[index]['properties']['place']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                )
              ),
              onTap: () {
                _alertMsg(context, '${_features[index]['properties']['type']}');
              }
            );
          },
        )
    )
    );
  }

}

  void _alertMsg(BuildContext context, String message){
    var alert = AlertDialog(
      title: Text('EarthQuakes'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      child: alert,
    );
  }


Future<Map> getJSON() async{
  String apiURL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(apiURL);

  return json.decode(response.body);
}

