import 'package:demo_app/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: (applicationBloc.currentLocation == null )?
      Center(child: CircularProgressIndicator(),)
      :ListView(
        children: [
          const TextField(
            decoration: InputDecoration(hintText: 'Search Location'),
          ),
          Container(
            height: 300.0,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(applicationBloc.currentLocation.latitude, applicationBloc.currentLocation.longitude),
                  zoom: 14),
            ),
          ),
          IconButton(onPressed: (){
            launchUrl(
              Uri.parse('https://www.google.ca/maps')
            );
          }, icon: const Icon(
            Icons.location_city,
            color: Colors.blue,
            size: 35,
          ))
        ],
      ),
    );
  }
}
