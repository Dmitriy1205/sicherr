import 'package:flutter/material.dart';
import 'package:sicherr/presentation/screens/map/widgets/map.dart';
import 'package:sicherr/presentation/screens/map/widgets/map_search_field.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MapBody(),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: MapSearchField(),
            ),
          ),
        ],
      ),
    );
  }
}
