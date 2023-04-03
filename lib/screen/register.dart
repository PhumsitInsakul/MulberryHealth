import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mulberryhealth/screen/profile_firebase.dart';

import 'member.dart';

class register_page extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<register_page> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Create an account"),
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
                              profile.Password = password!;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text("register",style: TextStyle(fontSize: 20)),
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try{
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: profile.email!,
                                        password: profile.Password!)
                                        .then((value){
                                      formKey.currentState!.reset();
                                      Fluttertoast.showToast(
                                          msg: "User account created successfully.",
                                          gravity: ToastGravity.TOP
                                      );
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context){
                                            return member_page();
                                          }));
                                    });
                                  }on FirebaseAuthException catch(e){
                                    print(e.code);
                                    String message;
                                    if(e.code == 'email-already-in-use'){
                                      message = "This email already exists. Please use another email instead.";
                                    }else if(e.code == 'weak-password'){
                                      message = "Password must be 6 or more characters long.";
                                    }else{
                                      message = e.message!;
                                    }
                                    Fluttertoast.showToast(
                                        msg: message,
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}