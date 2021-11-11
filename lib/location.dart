import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Position position;
  bool buttonDisplay = false;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  void getPosition() async {
    position = await _getGeoLocationPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        centerTitle: true,
        // leading: GestureDetector(
        //   child: Icon(Icons.location_on),
        //   onTap: () {},
        // ),
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonDisplay
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Longitude: "),
                            ),
                            Container(
                              child: Text(position.longitude.toString()),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Latitude: "),
                            ),
                            Container(
                              child: Text(position.latitude.toString()),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(),
              GestureDetector(
                child: ElevatedButton(
                  child: Text("Get location"),
                  onPressed: () {
                    setState(() {
                      buttonDisplay = true;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
