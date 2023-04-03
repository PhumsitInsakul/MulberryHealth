import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mulberryhealth/screen/profile_firebase.dart';
import 'package:mulberryhealth/screen/welcome.dart';

import 'member.dart';

class login_page extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<login_page> {

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();


  @override
  Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Login"),
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Please enter your email."),
                              EmailValidator(errorText: "Invalid email format")
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (email) {
                              profile.email = email!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Password", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(errorText: "Please enter your password."),
                            obscureText: true,
                            onSaved: (String? password) {
                              profile.Password = password;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text("sign in",style: TextStyle(fontSize: 20)),
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try{
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                                        email: profile.email!,
                                        password: profile.Password!)
                                        .then((value){
                                      formKey.currentState!.reset();
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context){
                                            return welcome_page();
                                          }));
                                    });
                                  }on FirebaseAuthException catch(e){
                                    Fluttertoast.showToast(
                                        msg: e.message!,
                                        gravity: ToastGravity.CENTER
                                    );
                                  }
                                }
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
}