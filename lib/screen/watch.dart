import 'dart:async';
import 'package:flutter/material.dart';
class Watch extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _Watch();
}
class _Watch extends State{
  final Stopwatch _stopwatch = Stopwatch();
  late Timer timer;
  String _result = '00:00:00';

  void _start(){
    timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) { setState(() {
      _result = '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
    }); });
    _stopwatch.start();
  }
  void _stop(){
    timer.cancel();
    _stopwatch.stop();
  }
  void _reset(){
    _stop();
    _stopwatch.reset();
    setState(() { });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the result
          Text(
            _result,
            style: const TextStyle(
              fontSize: 50.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Start button
              ElevatedButton(
                onPressed: _start,
                child: const Text('Start'),
              ),
              // Stop button
              ElevatedButton(
                onPressed: _stop,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text('Stop'),
              ),
              // Reset button
              ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
