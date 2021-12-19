import 'package:covid/widget/text.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Treatment extends StatefulWidget {
  Treatment({Key? key}) : super(key: key);

  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  int Started = 15;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/Home');
                      //scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                  ),
                  TextMainNormal('Isolation timer', 24),
                  Padding(padding: EdgeInsets.all(16)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey,
                          offset: Offset(1, 3))
                    ]),
                child: TweenAnimationBuilder<Duration>(
                    duration: Duration(
                        days: Started, hours: 0, minutes: 0, seconds: 0),
                    tween: Tween(begin: Duration(days: 15), end: Duration.zero),
                    onEnd: () {
                      print('Isolation ended');
                    },
                    builder:
                        (BuildContext context, Duration value, Widget? child) {
                      final days = value.inDays;
                      final hours = value.inHours % 60;
                      final minutes = value.inMinutes % 60;
                      final seconds = value.inSeconds % 60;
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35),
                          child: Text('$days:$hours:$minutes:$seconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)));
                    }),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Image(
                          width: 300,
                          height: 450,
                          image: AssetImage("assets/1.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Image(
                          width: 300,
                          height: 350,
                          image: AssetImage("assets/2.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Image(
                          width: 300,
                          height: 350,
                          image: AssetImage("assets/3.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Image(
                          width: 300,
                          height: 350,
                          image: AssetImage("assets/4.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xfff79f77),
                        elevation: 5,
                      ),
                      onPressed: () {
                        _launchURL();
                      },
                      child: Text("Find Food Online", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),

                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff80bef5),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/getvaccine');
                      },
                      child: Text("Find Test Centers", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://www.sampoornaahara.com/products/covid-19-meals';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}