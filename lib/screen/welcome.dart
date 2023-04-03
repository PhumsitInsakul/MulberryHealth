import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'member.dart';

class welcome_page extends StatelessWidget {

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Welcome"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text("You have subscribed to the package.",style: TextStyle(fontSize: 15),),
              Text(auth.currentUser!.email!,style: TextStyle(fontSize: 25),),
              ElevatedButton(
                child: Text("Log out",style: TextStyle(fontSize: 20),),
                onPressed: (){
                  auth.signOut().then((value){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context){
                          return member_page();
                        }));
                  });
                },
              )
            ],),
        ),
      ),
    );
  }
}