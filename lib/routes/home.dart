

import 'package:covid/api/api.dart';
import 'package:covid/widget/countup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:covid/widget/text.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Trace.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var active = 0;
  var recovered = 0;
  var deaths = 0;
  var countries = [
    'Global',
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burma',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo (Brazzaville)',
    'Congo (Kinshasa)',
    'Costa Rica',
    "Cote d'Ivoire",
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czechia',
    'Denmark',
    'Diamond Princess',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Holy See',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Korea, South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'MS Zaandam',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Namibia',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan*',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'US',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Vietnam',
    'West Bank and Gaza',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];
  var data = "";
  var dropdownValue = "India";
  final auth = FirebaseAuth.instance;
  dynamic latitude;
  dynamic longitude;
  @override
  void initState() {
    super.initState();
     _determinePosition();
    GetCases(dropdownValue).getCases().then((res) {
      setState(() {
        var confirmed = res['confirmed']['value'];
        recovered = res['recovered']['value'];
        deaths = res['deaths']['value'];
        active = confirmed - (recovered + deaths);
      });
    });
  }
  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position pos;
    permission = await Geolocator.checkPermission();
    pos =  await Geolocator.getCurrentPosition();
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }


    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    latitude = pos.latitude;
    longitude = pos.longitude;
  }

  @override
  Widget build(BuildContext context) {


    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    );
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                  ),
                  TextMain('Covid-19 App', 20),
                  Padding(padding: EdgeInsets.all(16)),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
              ),
              SizedBox(
                height: height - 93,
                width: width,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: Container(
                      //color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                            child: Image(
                              width: width,
                              height: height*0.3,
                              image: AssetImage("assets/corona.png"),
                            ),
                          ),
                          Container(
                            width: 300,
                            child: DropdownButton(
                                isExpanded: true,
                                value: dropdownValue,
                                hint: Text('Select country'),
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    dropdownValue = newvalue!;
                                    var response =
                                        GetCases(newvalue).getCases().then((res) {
                                      setState(() {
                                        var confirmed = res['confirmed']['value'];
                                        recovered = res['recovered']['value'];
                                        deaths = res['deaths']['value'];
                                        active = confirmed - (recovered + deaths);
                                      });
                                    });
                                  });
                                },
                                items: countries.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(children: [
                              TextMain(data, 14),
                              SizedBox(
                                height: 200,
                                width: 300,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 5.0,
                                            offset: Offset(0.0, 0.0))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.all(5)),
                                      TextActive("   Active Cases", 20),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Padding(padding: EdgeInsets.all(12)),
                                      Center(
                                        child: Column(
                                          children: [
                                            Countup(
                                              begin: 0,
                                              end: active.toDouble(),
                                              duration: Duration(seconds: 2),
                                              separator: ',',
                                              style: GoogleFonts.poppins(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 51,
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Container(
                                          height: 30,
                                          width: 300,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 51,
                              ),
                              SizedBox(
                                height: 200,
                                width: 300,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 5.0,
                                            offset: Offset(0.0, 0.0))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.all(5)),
                                      TextActive("   Death", 20),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Padding(padding: EdgeInsets.all(12)),
                                      Center(
                                        child: Column(
                                          children: [
                                            Countup(
                                              begin: 0,
                                              end: deaths.toDouble(),
                                              duration: Duration(seconds: 2),
                                              separator: ',',
                                              style: GoogleFonts.poppins(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 51,
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Container(
                                          height: 30,
                                          width: 300,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              //TextMain("How to prevent from COVID-19?", 22)
                            ]),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),

      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage("assets/corona.png"),
                      width: 150,
                      //fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(child: TextMainNormal("Features", 12)),
              ListTile(
                title: TextMainNormal('Symptoms', 14),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/symptoms');
                },
              ),

              ListTile(
                title: TextMainNormal('Vaccine', 14),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/getvaccine');
                },
              ),
              ListTile(
                title: TextMainNormal('Isolate', 14),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/isolation');
                },
              ),
              ListTile(
                title: TextMainNormal('Intensity', 14),
                onTap: () {
                  _launchURLBrowser();
                },
              ),
              ListTile(
                title: TextMainNormal('Trace', 14),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Trace(
                        latitude:latitude ,
                        longitude: longitude,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: TextMainNormal('Logout', 14),
                onTap: () {
                  auth.signOut();
                  Navigator.popAndPushNamed(context, '/signin');
                },
              ),

              SizedBox(
                height: 40,
              ),
            ],

          ),
        ),
      ),
    );
  }
}


_launchURLBrowser() async {
  const url = 'https://news.google.com/covid19/map?hl=en-IN&gl=IN&ceid=IN%3Aen';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


