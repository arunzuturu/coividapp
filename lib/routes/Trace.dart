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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
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
      'name': 'Arun',
      'status' : true
    });
  }
}

