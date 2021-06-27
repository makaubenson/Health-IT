import 'package:flutter/material.dart';
class FacilityDetails extends StatefulWidget {
  @override
  _FacilityDetailsState createState() => _FacilityDetailsState();
}

class _FacilityDetailsState extends State<FacilityDetails> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor:  Colors.blueGrey[900],
    appBar: AppBar(
      title: Text("Facility Details"),
      backgroundColor: Colors.blueGrey[900],
      elevation: 0.0
    ),


  );
}
