import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const GoogleMapsIntegration());
}

class GoogleMapsIntegration extends StatelessWidget {
  const GoogleMapsIntegration({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: CustomGoogleMaps(),
    );
  }
}

class CustomGoogleMaps extends StatelessWidget {
  const CustomGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(30.074486858721713, 31.23443094382675),
          zoom: 10,
        ),
      ),
    );
  }
}
