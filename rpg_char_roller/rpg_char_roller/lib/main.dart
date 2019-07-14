/* Simple exercise implementing the Stateful Widget
 * Roll the dice and find out what kind of Hero you are.
 *
 * Matteo
*/


import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int strength = 0;
  int dexterity = 0;
  int intelligence = 0;

  String str_txt = '';
  String dex_txt = '';
  String int_txt = '';


  void create_stats(){
    var rng = Random();

    setState ((){
      strength = 1 + (rng.nextInt(41));
      dexterity = 1 + (rng.nextInt(41 - strength));
      intelligence = 42 - strength - dexterity;
    });

    /* DEBUGGING
      print(' ------------------');
      print('Strength: $strength');
      print('Dexterity: $dexterity');
      print('Intelligence: $intelligence');
     */
      // STR

      if (strength < 4)
        str_txt = 'Even a chicken could kick your ass!';
      else if (strength < 8)
        str_txt = 'Your can probably carry a Book and a staff, that\'s all.';
      else if (strength < 14)
        str_txt = 'That\'s a good starting point, keep training '
            'and you\'ll do well.';
      else if (strength < 18)
        str_txt = 'Your can fight while carry your magician on your shoulders!';
      else
        str_txt = 'Your can fight a Dragon bare handed, you are a monster!';

      // DEX
      if (dexterity < 4)
        dex_txt = 'Don\'t even bother turning around, you are probably '
            'already dead.';
      else if (dexterity < 8)
        dex_txt = 'Mind those puddles, you could fall and hurt yourself!';
      else if (dexterity < 14)
        dex_txt = 'You can dodge some goblins\'s stones thrown at you '
            'if on a good day.';
      else if (dexterity < 18)
        dex_txt = 'Your can do some serious parkhour.';
      else
        dex_txt = 'Your can deflect a bullet before it\'s even shot.';

      // INT
      if (intelligence < 4)
        int_txt = 'You wouldn\'t understand anyway...';
      else if (intelligence < 8)
        int_txt = 'Your might be able to tie your shoes, with some assistance.';
      else if (intelligence < 14)
        int_txt = 'You might use some magic tricks and not having them '
            'backfire at you.';
      else if (intelligence < 18)
        int_txt = 'Your magic is so good you could freeze an enemy '
            'by just staring at them.';
      else
        int_txt = 'Your magic can materialise your wishes, '
            'you are so overpowered that you should be banned from the game.';


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: Text('Roll Your Character',
          ),
        ),
        backgroundColor: Colors.lightBlue.shade400,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text('WHAT KIND OF HERO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text('ARE YOU?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Text('STRENGTH',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 26.0),
                          child: SizedBox(
                            width:100,
                            child: Image.asset('images/str.png'),
                          ),
                        ),
                    ],
                    ),
                    Stack(
                      children: <Widget>[
                        Text('DEXTERITY',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 26.0),
                          child: SizedBox(
                            width:100,
                            child: Image.asset('images/dex.png'),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Text('INTELLIGENCE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 26.0),
                          child: SizedBox(
                            width:100,
                            child: Image.asset('images/int.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Strength is $strength: $str_txt',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Dexterity is $dexterity: $dex_txt',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Intelligence is $intelligence: $int_txt',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  create_stats();
                  },
                color: Colors.red.shade900,
                textColor: Colors.yellow.shade300,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ROLL',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Container(
width: 100.00,
height: 100.00,
decoration: new BoxDecoration(
image: new DecorationImage(
image: ExactAssetImage('/assets/images/str.png'),
fit: BoxFit.fitHeight,
),
),
),
Container(
width: 100.00,
height: 100.00,
decoration: new BoxDecoration(
image: new DecorationImage(
image: ExactAssetImage('/assets/images/dex.png'),
fit: BoxFit.fitHeight,
),
)
),
Container(
width: 100.00,
height: 100.00,
decoration: new BoxDecoration(
image: new DecorationImage(
image: ExactAssetImage('/assets/images/int.png'),
fit: BoxFit.fitHeight,
),
),
),*/
