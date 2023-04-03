import 'package:flutter/material.dart';
import 'time.dart';
import 'watch.dart';

class MyTimer extends StatefulWidget {
  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final _pageOptions =
  [
    Time(),
    Watch(),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Health Time"),
        ),
        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_outlined),
              label: 'Set time',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amberAccent[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

