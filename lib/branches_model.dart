import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchesModel {
  final String name;
  final String branchId;
  final LatLng latLng;

  BranchesModel({
    required this.name,
    required this.branchId,
    required this.latLng,
  });
}

List<BranchesModel> branches = [
  BranchesModel(
    name: 'Pane Vino',
    branchId: '1',
    latLng: const LatLng(30.043282080654812, 31.232354197068695),
  ),
  BranchesModel(
    name: 'Bird Cage',
    branchId: '2',
    latLng: const LatLng(30.042812854045586, 31.23215054765856),
  ),
  BranchesModel(
    name: 'Rouh Beirut',
    branchId: '3',
    latLng: const LatLng(30.045148828333396, 31.2362916795894),
  ),
];
