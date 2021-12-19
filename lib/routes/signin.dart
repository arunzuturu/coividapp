import 'package:covid/routes/uilogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


import 'home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  late Position pos ;
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text("Welcome,",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    SizedBox(height: 9,),
                    Text("Sign in to continue!",style: TextStyle(fontSize: 20,color: Colors.grey[500]),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Email ID",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text("Forgot Password ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: (){},
                        padding: EdgeInsets.all(0),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff009ffd),
                                Color(0xff3eadcf),
                                Color(0xff5de6de),
                              ],
                            ),
                          ),
                          child: InkWell(
                            onTap: (){

                              auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
                              });

                            },
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                              child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),

                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("I'm a new user.",style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SignupPage();
                          }));
                        },
                        child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}