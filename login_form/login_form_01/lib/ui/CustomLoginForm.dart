import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget{
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

// Class to store name and PW to simulate
// DB-stored data
class _LoginData{
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm>{
  final _formKey = GlobalKey<FormState>();

  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey, // _ means it's private
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset("images/face.png",
            width: 90,
            height: 90,
            color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  gapPadding: 3.3,
                  borderRadius: BorderRadius.circular(3.3),
                )
              ),
              validator: (value){
                if (value.isEmpty){
                  return "Please Enter Name";
                } else {
                  _data.name = value;
                  print("Name: ${_data.name}");

                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    gapPadding: 3.3,
                    borderRadius: BorderRadius.circular(3.3),
                  )
              ),
              validator: (value){
                if (value.isEmpty){
                  return "Please Enter Password";
                } else {
                  _data.password = value;
                  print("Password: ${_data.password}");
                }
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      // set the State so we can update the variable in the
                      // Welcome msg
                      setState((){
                        _data.name = _data.name;
                      });

                      // if the form's current state is good show a SnackBar
                      if (_formKey.currentState.validate()){
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text("All is good")));
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      // if the form's current state is good clear everything
                      if (_formKey.currentState.validate()){
                        _formKey.currentState.reset();
                        setState((){
                          _data.name = "";
                        });
                      }
                    },
                    child: Text("Clear"),
                  ),
                )
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              // If _data.name is empty don't show anything
              child: _data.name.isEmpty ? Text("") : Text("Welcome ${_data.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                )
                ),
            ),
          ),
        ]
      )
    );
  }
}

