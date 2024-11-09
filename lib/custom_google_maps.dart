import 'package:flutter/material.dart';
import 'package:google_map_integration/branches_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'constants.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;
  late LatLng initialLatLng =
      const LatLng(30.043170631919455, 31.233148130873957);
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: initialLatLng,
      zoom: streetZoomView,
    );
    initMarkers();
    super.initState();
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/maps_styles/night_map_style.json');
    googleMapController.setMapStyle(nightMapStyle);
  }

  initMarkers() {
    var places = branches
        .map(
          (branches) => Marker(
            markerId: MarkerId(branches.branchId.toString()),
            position: branches.latLng,
            infoWindow: InfoWindow(
              title: branches.name,
            ),
          ),
        )
        .toSet();
    markers.addAll(places);
    setState(() {});
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          zoomControlsEnabled: false,
          markers: markers,
          onMapCreated: (controller) => {
            googleMapController = controller,
            initMapStyle(),
          },
        ),
      ],
    );
  }
}

/*
  - Google Map Types (Whole Change + Supported from Google)
  1- hybrid
  2- terrain
  3- satellite
  4- normal
  5- none
 */

/*
markers: {
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure),
              markerId: const MarkerId('1'),
              position: initialLatLng,
            ),
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueCyan),
              markerId: const MarkerId('2'),
              position: const LatLng(30.10003440083548, 31.230139409599772),
            ),
          }, 
          */
          // Positioned(
        //   bottom: 16,
        //   right: 16,
        //   left: 16,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       googleMapController.animateCamera(
        //         CameraUpdate.newLatLng(
        //           const LatLng(30.79641090743415, 30.814353895476902),
        //         ),
        //       );
        //     },
        //     child: const Text('Search'),
        //   ),
        // )