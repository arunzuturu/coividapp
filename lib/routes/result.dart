import 'package:covid/routes/result.dart';
import 'package:covid/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'getvaccine.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.counter}) : super(key: key);
  final int counter;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;
    print(counter);
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                TextMainNormal('Results', 20),
                Padding(padding: EdgeInsets.all(16)),
              ],
            ),
            SizedBox(height: 40,),
            Center(
              child: (counter<4) ?
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.5,
                          width: width,
                          //padding: EdgeInsets.all(50),
                          //alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)), // Set rounded corner radius
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.grey,
                                    offset: Offset(1, 3))
                              ] // Make rounded corner of border
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 40,),
                              Image(
                                height:height * 0.17,
                                width: width *0.42,
                                image: AssetImage('assets/greentick.png',),
                              ),
                              SizedBox(height: 40,),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Align(child: Text("You Are Safe", style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        InkWell(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Colors.green,
                            child: Center(
                              child: Text('Find Vaccination Centres', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,),
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetVaccineRoute()));
                          },
                        )
                      ],
                    ),
                  ) : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: height * 0.5,
                  width: width,
                  //padding: EdgeInsets.all(50),
                  //alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      Image(
                        height:height * 0.17,
                        width: width *0.42,
                        image: AssetImage('assets/close.png',),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Align(child: Text("You are more likely to have Covid-19. Visit your nearest healthcare Centre.", style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(height: 40,),
                      InkWell(
                        child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Colors.green,
                            child: Center(
                              child: Text('Book your Test', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,),
                              ),
                            )
                        ),
                        onTap: (){
                          _launchURL();
                        },
                      )

                    ],
                  ),
                ),
              ),
            ),
          ],
        )
            // Image.network('https://cdn-icons-png.flaticon.com/512/3017/3017399.png',height: height * 0.17,
            //    width: width * 0.4,fit: BoxFit.fill,),
      ),
    );
  }
}
_launchURL() async {
  const url =
      'https://www.myhealthspace.in/book-covid-test#box_testform';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
