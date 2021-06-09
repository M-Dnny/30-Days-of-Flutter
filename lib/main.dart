import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List restaurants = [
    'Naaz Hotel',
    'Sahara Hotel',
    'Swiggy',
    'Zomato',
    'Ammi ke haath Ka khana',
    'Dhaba'
  ];

   var currentIndex;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What do you want to eat?'),
              Padding(padding: EdgeInsets.all(16.0)),
              if (currentIndex != null)
                Text(
                  restaurants[currentIndex],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              Padding(padding: EdgeInsets.all(16.0)),
              TextButton(
                onPressed: () {
                  updateIndex();
                },
                child: Text(
                  'Random Restaurent Generator',
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  primary: Colors.blue,
                  padding: EdgeInsets.all(15),
                  textStyle: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
