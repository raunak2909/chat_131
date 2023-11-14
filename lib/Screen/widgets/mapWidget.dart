// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talklytic/Data/Maps/key.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng sourceLocation = LatLng(29.149187, 75.721657);
  static const LatLng targetLocation = LatLng(29.073762, 75.852625);

  List<LatLng> polylineCoordinates = [];
  List<String> sendLocationTiming = ['45 min', '1 hour', '5 hour', '8 hour'];

  void getPolyPoints() async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        MapApiKey.MapKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(targetLocation.latitude, targetLocation.longitude),
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      setState(() {});
    } catch (e) {
      print("Error getting route: $e");
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Maps',
                  style: TextStyle(
                    fontFamily: GoogleFonts.cinzel().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: sourceLocation,
                  zoom: 10.5,
                ),
                polylines: {
                  Polyline(
                      polylineId: PolylineId('route'),
                      points: polylineCoordinates),
                },
                markers: {
                  Marker(
                    markerId: MarkerId('Source'),
                    position: sourceLocation,
                  ),
                  Marker(
                    markerId: MarkerId('destination'),
                    position: targetLocation,
                  ),
                },
              ),
            ),
            SizedBox(height: 50),
            CupertinoButton.filled(
                child: Text('Share Location'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController: FixedExtentScrollController(
                            initialItem: 0,
                          ),
                          children: [
                            Text(sendLocationTiming[0]),
                            Text(sendLocationTiming[1]),
                            Text(sendLocationTiming[2]),
                            Text(sendLocationTiming[3]),
                          ],
                          onSelectedItemChanged: (value) {},
                        ),
                      );
                    },
                  );
                }),
            SizedBox(height: 40),
            CupertinoButton.filled(
              child: Text('People'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
