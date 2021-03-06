import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String __infoText = "Pode Entrar!";

  void _peopleChange(int delta) {
    setState(() {
      _people += delta;

      if(_people >= 20) {
        __infoText = "Lotado!";
      } else if(_people < 0) {
        __infoText= "Mundo invertido?";
      } else {
        __infoText = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpeg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            "Pessoas: $_people",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _peopleChange(1);
                    },
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _peopleChange(-1);
                    },
                  ))
            ],
          ),
          Text(
            __infoText,
            style:
            TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          )
        ])
      ],
    );
  }
}

