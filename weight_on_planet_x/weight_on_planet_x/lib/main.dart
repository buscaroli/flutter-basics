/* Learning the Basics of Flutter - Radio Buttons
 * Enter your weight, select the Planet and you'll get your
 * weight on that planet
 *
 * Based on the Udemy course of Paulo Dichone
*/

import 'package:flutter/material.dart';
import './ui/home.dart';
void main(){
  runApp(
    new MaterialApp(
      title: "Weight on Planet X",
      home: new Home(),
    )
  );
}