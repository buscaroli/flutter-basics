// This Class contains the UI of the Application, an helping
// class to keep the user's data together and the
// calculation function

import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return HomeState ();
  }

}

// Class to store Age, Height and Weight

class _LoginData{
  double age = 0.0;
  double height = 0.0;
  double weight = 0.0;
  double bmi_number = 0.0;
  String bmi_description = "";
}

class HomeState extends State<Home>{
  final TextEditingController _userDataController1 = TextEditingController();
  final TextEditingController _userDataController2 = TextEditingController();
  final TextEditingController _userDataController3 = TextEditingController();

  _LoginData _data = _LoginData();

  // Function that calculates the BMI (number and Description)
  void calculateBMI(double age, double height, double weight){
    setState((){
      _data.bmi_number = weight / ((height / 100) * (height / 100));
      if (_data.bmi_number < 18.0) {
        _data.bmi_description = "UNDERWEIGHT";
      }
      else if (_data.bmi_number > 25.0) {
        _data.bmi_description = "OVERWEIGHT";
      }
      else {
        _data.bmi_description = "HEALTHY WEIGHT";
      }
    });

  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      // The following Container will have the Logo,
      // the three TEXT FIELDS and another Container
      // for the Button and Text with the Result of the
      // Computation
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Image.asset('images/bmilogo.png',
            height: 120.00,
            width: 200.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _userDataController1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Your Age",
                        hintText: "in years",
                        icon: Icon(Icons.person_outline),
                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return "Please Enter Age";
                        } else {
                          _data.age = double.parse(value);
                        }
                      },
                    ),
                    TextFormField(
                      controller: _userDataController2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Your Height",
                        hintText: "in cm",
                        icon: Icon(Icons.equalizer),
                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return "Please Enter Height";
                        } else {
                          _data.height = double.parse(value);
                        }
                      },
                    ),
                    TextFormField(
                      controller: _userDataController3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Your Weight",
                        hintText: "in Kg",
                        icon: Icon(Icons.line_weight),
                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return "Please Enter Weight";
                        } else {
                          _data.weight = double.parse(value);
                        }
                      },
                    ),
                    //
                    // Adding a Raised Button and the Output Text
                    //
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: (){
                                print("Age: ${_data.age}");
                                calculateBMI(double.parse(_userDataController1.text), double.parse(_userDataController2.text), double.parse(_userDataController3.text));
                              },
                              child: Text("Submit",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 20.0),
                            child: Column(
                              children: <Widget>[
                                // Only show the text after the BMI has been calculated
                                // which means it's different from its initial value of 0.0
                                _data.bmi_number == 0.0 ? Text("") : Text("Your BMI is ${_data.bmi_number.toStringAsFixed(1)}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text('${_data.bmi_description}',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ]
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}