import 'dart:js';

import 'package:bnb_sample/FromHome.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;

  void _incrementCounter(){
    setState(() {
      counter++;
    });
  }

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

  final List<Widget> _widgetOptions = <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          ElevatedButton(onPressed: () {}, child: Text('NextPage')),
          Text(''),
          Text(
            'Index 1: Business',
            style: optionStyle,
          ),
        ]
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: _incrementCounter,tooltip: 'Increment',child: Icon(Icons.add),),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => FromHome()
              )
            );
          }, 
          child: Text('NextPage')),
          Text('$counter'),
          Text(
            'Index 0: Home',
            style: optionStyle,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('NextPage')),
          Text(''),
          Text(
            'Index 2: School',
            style: optionStyle,
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}