import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:papikost/core/permition/permission.dart';

class LocationProv extends ChangeNotifier {
  Position? _position;
  Position? get positionUser => _position;

  // ignore: cancel_subscriptions
  StreamSubscription<Position>? streamLocation;

  //Load Location User
  void loadLocation() async {
    //getPermition
    Permission.instance.gpsPermission();

    //getPosition
    _position = await Geolocator.getCurrentPosition();

    streamLocation = Geolocator.getPositionStream().listen((event) async {
      myLoc(event);
    });

    print(_position!.latitude);

    notifyListeners();
  }

  void myLoc(Position position) async {
    print('hasil nya : ${position.latitude}');
  }

  void cancel() async {
    await streamLocation!.cancel();
  }
}
