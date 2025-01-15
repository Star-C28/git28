import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceRollingApp());
}

class DiceRollingApp extends StatelessWidget {
  const DiceRollingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Rolling App',
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _diceNumber = 1;

  void _rollingFun() {
    setState(() {
      _diceNumber = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text("Dice Roll"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/pic$_diceNumber.jpeg',
              height: 250,
              width: 250,
            ),
            SizedBox(
              height:10,
            ),
            ElevatedButton(
              onPressed: _rollingFun,
              child: Text('Roll'),
              
            )
          ],
        ),
      ),
    );
  }
}


