import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  int radioValue = 0;
  double _result = 0.0;

  void handleRadioValue(int value){
    setState((){
      radioValue = value;
      switch (radioValue){
        case 0:
          _result = calculateWeight(_weightController.text, 0.06);
          break;
        case 1:
          _result = calculateWeight(_weightController.text, 0.38);
          break;
        case 2:
          _result = calculateWeight(_weightController.text, 0.91);
          break;
        default:
          _result = calculateWeight(_weightController.text, 0.06);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.teal,
      body: new Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Image.asset('images/planet.png',
            height: 140.0,
            width: 200,
            ),
            Container (
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your Weight on Earth (pounds)",
                      hintText: "In Pounds",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.white,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValue,
                      ),
                      Text("Pluto",
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 20.0,
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValue,
                      ),
                      Text("Mars",
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 20.0,
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.white,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValue,
                      ),
                      Text("Venus",
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 20.0,
                        ),
                      )
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 20.0),
                    child:
                    _weightController.text.isEmpty
                        ?
                        Text("Enter weight in pounds",
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )
                        )
                        :
                        Text("${_result.toStringAsFixed(1)} pounds",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ),
                        ),
                  )
                ],

              )
            )
          ]
        )
      ),
    );
  }

}

double calculateWeight(String weight, double multiplier){
  if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
    return int.parse(weight) * multiplier;
  } else {
    print("ERROR");
    return 0.0;
  }
}