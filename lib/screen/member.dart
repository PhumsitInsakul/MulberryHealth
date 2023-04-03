import 'package:flutter/material.dart';
import 'package:mulberryhealth/screen/login.dart';
import 'package:mulberryhealth/screen/register.dart';

class member_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register & Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/register.png"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label:
                  Text("Create an account", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return register_page();
                        })
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("login", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return login_page();
                        })
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
class register_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Account"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.email),
                  Text("Email", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(Icons.key),
                  Text("Password", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(Icons.monitor_weight),
                  Text("Weight", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(Icons.height),
                  Text("Height", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(Icons.numbers),
                  Text("Age", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(Icons.person),
                  Text("Account Name", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Create Account",
                          style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                          return profile_page();
                        }));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
