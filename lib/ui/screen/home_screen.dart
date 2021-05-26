import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:papikost/ui/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GoogleMapController? googleMapController;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: deviceHeight(context) * 0.4,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                  setState(() {});
                },
                initialCameraPosition: _kGooglePlex,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(-6.20978, -64.91262), zoom: 14.0)));
            },
            child: Center(
              child: Container(
                width: 100,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
