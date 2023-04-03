import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class mindfulness_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mindfulness"),
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
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage("assets/images/meditation_bg03.jpg"),
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
                                          player.play('Sea01.mp3');
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
    );
  }
}
