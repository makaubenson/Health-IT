import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health/models/facilitymodel.dart';
import 'package:health/src/facility_details.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://kmhfl.cryosoft.co.ke/api";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode == 200){
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blueGrey[900],
  appBar: AppBar(
    elevation: 0.0,
    title: Text("HealthCare Finder"),
    backgroundColor: Colors.blueGrey[900],
  ),
 body: SafeArea(
   child: ListView(
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           height:250 ,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Colors.white,

           ),
           child: Image(
             height: 250,
              image:
              AssetImage('images/healthcare.jpg'),
            ),
         ),
       ),

    (users.contains(null) || users.length < 0 || isLoading)?
     Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),)):
     Container(
       height:800,
       child: ListView.builder(
    itemCount: users.length,
    itemBuilder: (context,index){
    return getCard(users[index]);
    }),
     ),

     ],
   ),
 ),
);
  Widget getCard(item){
    var fullName = item['Name'];


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FacilityDetails()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,

          ),
          width: double.infinity,


          height: 180,
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item['Name'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      'Status :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                        item['Operation status'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Text(
                      'Facility type :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      'Private',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Text(
                      'Distance to the facility :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      '1 KM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
