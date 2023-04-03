import 'package:flutter/material.dart';
import 'package:mulberryhealth/screen/zen.dart';
import 'package:mulberryhealth/screen/mindfulness.dart';
import 'package:mulberryhealth/screen/lovingandkindness.dart';

class meditation_page extends StatelessWidget {
  final List<String> _meditationTypes = ['Mindfulness','Loving-Kindness','Zen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
      ),
      body: ListView.builder(
        itemCount: _meditationTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_meditationTypes[index]),
            onTap: () {
              if(index == 0){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                  return mindfulness_page();
                }));
              }
              if(index == 1){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                  return lovingandkindness_page();
                }));
              }
              if(index == 2){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                  return zen_page();
                }));
              }
            },
          );
        },
      ),
    );
  }
}