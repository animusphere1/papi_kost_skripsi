import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:papikost/core/controller/location_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? googleMapController;

  @override
  initState() {
    super.initState();
    // Provider.of<LocationProv>(context, listen: false).loadLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Consumer<LocationProv>(
              builder: (context, prov, _) {
                if (prov.address == null) {
                  prov.loadLocation();
                  return Text('Sabar');
                }

                return Text(prov.address.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
