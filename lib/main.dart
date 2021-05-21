import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.lightGreen,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String message = 'Start!';
  int score = 0;

  void randomDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      if (leftDiceNumber > rightDiceNumber){
        message = 'You Won!';
        score++;
      }
      else if (leftDiceNumber < rightDiceNumber){
        message = 'You lost..';
        score--;
      }
      else {
        message = 'Draw';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Yours'),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.computer),
                    title: Text('CPU\'s'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                elevation: 10.0,
              ),
              onPressed: () {
                randomDice();
              },
              child: Text(
                'Roll Dice',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Text(
              'Your score : $score',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded class (flex)
// stful
