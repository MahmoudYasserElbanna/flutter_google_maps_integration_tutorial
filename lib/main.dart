import 'package:flutter/material.dart';
import 'package:google_map_integration/custom_google_maps.dart';

void main() {
  runApp(const GoogleMapsIntegration());
}

class GoogleMapsIntegration extends StatelessWidget {
  const GoogleMapsIntegration({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomGoogleMaps(),
    );
  }
}
