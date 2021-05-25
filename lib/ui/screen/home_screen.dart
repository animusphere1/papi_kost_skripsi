import 'package:flutter/material.dart';
import 'package:papikost/core/controller/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Consumer<LocationProv>(
          builder: (context, prov, _) {
            if (prov.positionUser == null) {
              prov.loadLocation();
              return Text('Mengambil Data');
            }

            return Text(prov.positionUser!.latitude.toString());
          },
        ),
      ),
    );
  }
}
