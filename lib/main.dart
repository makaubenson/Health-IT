
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



void main(){


  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("HealthCare Finder"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Image(
            image:
                AssetImage('images/healthcare.jpg'),
          ),

    ),
  ));



} //end of main
