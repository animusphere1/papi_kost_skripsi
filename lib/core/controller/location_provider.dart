import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:papikost/core/permition/permission.dart';
import 'dart:math' show cos, sqrt, asin;

class LocationProv extends ChangeNotifier {
  Position? _position;
  Position? get positionUser => _position;

  // ignore: cancel_subscriptions
  StreamSubscription<Position>? streamLocation;

  String? address;

  //Load Location User
  void loadLocation() async {
    //getPermition
    await Permission.instance.gpsPermission();

    //getPosition
    streamLocation = Geolocator.getPositionStream().listen((event) {
      myLoc(event);
    });

    notifyListeners();
  }

  void myLoc(Position position) async {
    print('hasil nya : ${position.latitude} & ${position.longitude}');

    List<Placemark> geoCoding = [];

    print(calculateDistance(position.latitude, position.longitude,
        position.latitude, position.longitude));

    geoCoding =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    print(geoCoding[0].street);

    address = geoCoding[0].street;

    notifyListeners();
  }

  void cancel() async {
    await streamLocation!.cancel();
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
