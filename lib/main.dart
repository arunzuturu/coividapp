
import 'package:covid/routes/isolation.dart';
import 'package:covid/routes/signin.dart';
import 'package:covid/routes/splash.dart';
import 'package:covid/routes/uilogin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covid/routes/home.dart';
import 'package:covid/routes/symptoms.dart';
import 'package:covid/routes/getvaccine.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronavirus Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/signup':(context) => SignupPage(),
        '/signin':(context) => LoginPage(), //LoginScreen()
        '/home': (context) => Home(),
        '/symptoms': (context) => Symptoms(),
        '/getvaccine': (context) => GetVaccineRoute(),
        '/isolation' :(context) => Treatment(),
      },
    );
  }
}


