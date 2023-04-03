import 'package:flutter/material.dart';
import 'package:mulberryhealth/screen/meditation.dart';
import 'package:mulberryhealth/screen/member.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mulberryhealth/screen/maintimer.dart';
import 'package:mulberryhealth/screen/qrscan.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => home_page();
}

class home_page extends State<MyHomePage> /*with TickerProviderStateMixin*/ {
  //final player = AudioPlayer();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return meditation_page();
          }),
        );
      }
      if(index == 2){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context){
            return member_page();
          }),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
              return MyTimer();
            }));
          },//ส่งไปยังหน้าถัดไป
          icon: Icon(Icons.timer),
        ),
        title: Text('Mulberry Health'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return QRViewExample()/*Text("qrcodeScanner")*/;
                }));
              },
              icon: Icon(Icons.qr_code_scanner_rounded)),
        ],
      ),

      drawer: Container(
        width: 250,
        color: Colors.white,
      ),

      body: Center(
          child: Column(
              children: <Widget>[
                Expanded(child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: .63,//ขนาดของ child container
                    crossAxisSpacing: 15,//ระยะห่าง container บน-ล่าง
                    mainAxisSpacing: 15,//ระยะห่าง container ซ้าย-ขวา
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage("assets/images/meditation_bg08.jpg"),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          final player = AudioCache();
                                          player.play('Spa_Meditation_Forest.mp3');

                                          /*AnimatedBackground(
                                            behaviour: RandomParticleBehaviour(
                                              options: const ParticleOptions(
                                                spawnMaxRadius: 50,
                                                spawnMinSpeed: 10.00,
                                                particleCount: 25,
                                                spawnMaxSpeed: 50,
                                                minOpacity: 0.3,
                                                spawnOpacity: 0.4,
                                                baseColor: Colors.lightGreen,
                                              )
                                            ),
                                            vsync: this,
                                            child: const Center(
                                              child: Text(" "),
                                            )
                                          );*/

                                        }, child: Text('Breath in',style: TextStyle(fontSize: 20),))))
                          ],
                        ),
                      ),
                    ]
                ),
                ),
              ]
          )
      ),

      bottomNavigationBar: BottomNavigationBar(//เพิ่มหน้าถัดไป
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Subscription',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}