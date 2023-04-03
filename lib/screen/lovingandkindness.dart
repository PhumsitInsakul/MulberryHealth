import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class lovingandkindness_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love & Kindness"),
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
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage("assets/images/meditation_bg04.jpg"),
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
                                          player.play('Sea02.wav');
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
