import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trace extends StatefulWidget {
  final double latitude;
  final double longitude;
  Trace({required this.latitude, required this.longitude});


  @override
  _TraceState createState() => _TraceState();
}

class _TraceState extends State<Trace> {
  Stream<QuerySnapshot> getItems() async* {
    yield* FirebaseFirestore.instance.collection("items").snapshots();
  }

  late String _name, _status;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: Stack(
                      children:[
                        GoogleMap(
                          mapType: MapType.normal,
                          myLocationButtonEnabled: true,
                          onMapCreated: _onMapCreated,
                          markers: markers,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  widget.latitude,widget.longitude),
                              zoom: 14),
                        ),
                        Positioned(
                            bottom: 50,
                            right: 10,
                            child:
                            FlatButton(
                              child: Icon(Icons.pin_drop),
                              color: Colors.green,
                              onPressed: (){
                                _addGeoPoint();
                              },
                            )
                        ),

                      ]
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      _name = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Name: ",
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
                SizedBox(
                  height: 20,
                ),

                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _status.trim();
                      if(_status == '1'){
                        _status = 'true';
                      }
                      else{
                        _status = 'false';
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Covid Status : (1 or 0) ",
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
              ],
            ),
          ),
        ),
      );
    }
  void _onMapCreated(GoogleMapController controller) async{
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('id-1'),
        position: LatLng(widget.latitude,widget.longitude),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    mapController = controller;
  }
  Future<DocumentReference> _addGeoPoint() async {
    GeoFirePoint point = geo.point(latitude: widget.latitude, longitude: widget.longitude);
    return firestore.collection('locations').add({
      'position': point.data,
      'name': '$_name',
      'status' : true
    });
  }
}

