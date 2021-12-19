import 'package:covid/routes/result.dart';
import 'package:covid/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}
bool _value1 = false;
bool _value2 = false;
bool _value3 = false;
bool _value4 = false;
bool _value5 = false;
bool _value6 = false;
bool _value7 = false;
bool _value8 = false;



int counter = 0;
class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: SingleChildScrollView(
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
                  TextMainNormal('Symptoms Check', 20),
                  Padding(padding: EdgeInsets.all(16)),
                ],
              ),
              SizedBox(height: 40,),
                Row(
                  children: [
                    Container(
                      height: height * 0.17,
                      width: width * 0.5,
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
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Align(child: Text("Cough", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),),
                              alignment: Alignment.topLeft,
                            ),
                          ),
            SizedBox(height: 40,),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _value1 = !_value1;
                        counter ++;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: _value1
                          ? Icon(
                        Icons.check,
                        size: 20.0,
                        color: Colors.blue,
                      )
                          : Icon(
                        null,
                        size: 20.0,
                      ),
                    ),
                  ),),
            )
                        ],
                      ),
                    ),

                    // Image.network('https://cdn-icons.flaticon.com/png/512/2805/premium/2805856.png?token=exp=1639873091~hmac=3e42ab0dbbf2927b5e9e9bae275fa906',height: height * 0.17,
                    //   width: width * 0.4,fit: BoxFit.fill,),
                    Image(
                      height:height * 0.17,
                      width: width *0.42,
                      image: AssetImage('assets/Cough.png',),
                    )
                  ],
                ),
              SizedBox(height: height*0.07,),
              //Second Row
              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("Fatigue", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value2 = !_value2;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value2
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons-png.flaticon.com/512/3017/3017399.png',height: height * 0.17,
                  //    width: width * 0.4,fit: BoxFit.fill,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/fatigue.PNG',),
                  )
                ],
              ),
              SizedBox(height: height*0.07,),
              // Third Row

              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("Diarrhea", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value3 = !_value3;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value3
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons-png.flaticon.com/512/2927/2927511.png',height: height * 0.17,
                  //   width: width * 0.4,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/diah.PNG',),
                  )
                ],
              ),
              SizedBox(height: height*0.07,),
              // Fourth Row
              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("HeadAche", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value4 = !_value4;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value4
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons.flaticon.com/png/512/2895/premium/2895410.png?token=exp=1639865470~hmac=c455d269885fd75efbd9ebf14eddef45',height: height * 0.17,
                  //   width: width * 0.4,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/head.PNG',),
                  )

                ],
              ),

              // fifth row
              SizedBox(height: height*0.07,),
              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("Nasal Congestion", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value5= !_value5;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value5
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons.flaticon.com/png/512/3954/premium/3954171.png?token=exp=1639869228~hmac=ac99190dff3adc6561e8641c856b8a11',height: height * 0.17,
                  //   width: width * 0.4,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/nasal.PNG',),
                  )
                ],
              ),
              // Sixth row
              SizedBox(height: height*0.07,),
              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("Dizziness", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value6= !_value6;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value6
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons-png.flaticon.com/512/2038/2038401.png',height: height * 0.17,
                  //   width: width * 0.4,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/chill.PNG',),
                  )
                ],
              ),
              // Seventh Row
              SizedBox(height: height*0.07,),
              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("Sore throat", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value7= !_value7;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value7
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons.flaticon.com/png/512/3954/premium/3954169.png?token=exp=1639869005~hmac=d936e5d989758e571501f06a301fc914',height: height * 0.17,
                  //   width: width * 0.4,scale: 1.0,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/sore.PNG',),
                  )
                ],
              ),
              // Eigth Row
              SizedBox(height: height*0.07,),
              Row(
                children: [
                  Container(
                    height: height * 0.17,
                    width: width * 0.5,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Align(child: Text("Loss of Taste", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _value8= !_value8;
                                  counter ++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: _value8
                                    ? Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  null,
                                  size: 20.0,
                                ),
                              ),
                            ),),
                        )
                      ],
                    ),
                  ),
                  // Image.network('https://cdn-icons-png.flaticon.com/512/2037/2037981.png',height: height * 0.17,
                  //   width: width * 0.4,),
                  Image(
                    height:height * 0.17,
                    width: width *0.42,
                    image: AssetImage('assets/taste.PNG',),
                  )
                ],
              ),
              SizedBox(height: height*0.07,),
              InkWell(
                child: Container(
                  width: width,
                  alignment: Alignment.centerRight,
                  child: MaterialButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(counter: counter)));
                  },
                    child: Text('Submit',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    color: Colors.blueGrey[200],
                  ),
                ),
                onTap: (){
                  if(_value1 == true)
                    counter++;
                  if(_value2 == true)
                    counter++;
                  if(_value3 == true)
                    counter++;
                  if(_value4 == true)
                    counter++;
                  if(_value5 == true)
                    counter++;
                  if(_value6 == true)
                    counter++;
                  if(_value7 == true)
                    counter++;
                  if(_value8 == true)
                    counter++;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ResultPage(counter: counter),
                  //     ));





                },
              ),
            ],
          ),
              )),
        ),
      ),

    );
  }
}
