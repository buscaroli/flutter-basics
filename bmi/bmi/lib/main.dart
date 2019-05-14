/* FLUTTER APP TO CALCULATE THE BMI INDEX
 * Challenge exercise from the Udemy Course of Paulo Dichone
 *
 * First Flutter App developed independently.
 *
 * TO DO: The exercise required that the user entered their Age,
 * which is not used in the calculation of the BMI.
 * The Application could be improved by replacing the Age Text Field
 * with a radio button to ask for the sex of the user as the threshold
 * for being under- and over-weight is different in men and women.
 * At the moment the values used are just an approximation
 * for the sake of the exercise.
 *
 */

import 'package:flutter/material.dart';
import './ui/home.dart';

void main(){
  runApp(MaterialApp(
    title: "BMI",
    home: Home(),
  ));
}