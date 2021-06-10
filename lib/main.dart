import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Create List ramdom generation

  List restaurants = ['McDonald\'s', 'Pizza Hut', 'Swiggy', 'Zomato', 'Ghar ki Maggi'];

  // This property hold the list texts and send them ramdomly

  var currentIndex;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Widget 0

              Text('From where do you want to eat?',
                  style: TextStyle(fontSize: 23)),

              // Padding

              Padding(padding: EdgeInsets.all(30.0)),

              // if currentIndex is null then pass text widget 1

              if (currentIndex != null)

                // Text Widget 1, Passing restaurant list with currentIndex to generate ramdom list texts

                Text(
                  restaurants[currentIndex],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              Padding(padding: EdgeInsets.all(25.0)),

              // TextButton, by clicking on the textbutton random text will dispay with the help of updateIndex property in onpressed

              TextButton(
                onPressed: () {
                  updateIndex();
                },
                child: Text(
                  'Generate',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  primary: Colors.blue,
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helps to pick list texts

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
