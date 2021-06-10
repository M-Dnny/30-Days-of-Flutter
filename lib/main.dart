import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();

  List<bool> _selection = [true, false, false];
  var tip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Day 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              
              if (tip != null)
              Padding(padding: EdgeInsets.all(20),
              child: Text(tip,
              style: TextStyle(fontSize: 25.0),),),
              
              Text('Total Amount'),
              SizedBox(
                width: 120.0,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Enter Amount'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToggleButtons(
                    children: [Text('10%'), Text('15%'), Text('20%')],
                    isSelected: _selection,
                    onPressed: updateSelection),
              ),
              TextButton(
                onPressed: () {
                  calculate();
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculate() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final percentage = [0.1, 0.15, 0.2][selectedIndex];

    final total = (totalAmount * percentage).toStringAsFixed(2);
    setState(() {
      tip = '$total'; 
    });
  }
}
