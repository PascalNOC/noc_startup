import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {

    const position = LatLng(35.772710, -5.785018);

    return FlutterMap(
      options: const MapOptions(
        initialCenter: position,
        initialZoom: 17,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: "com.example.app",
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: position,
              width: 50,
              height: 50,
              child: const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}