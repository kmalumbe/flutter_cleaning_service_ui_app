import 'package:flutter/material.dart';

import '../cleaningPage.dart';
import '../homeScreen.dart';

class AllServicesPage extends StatefulWidget {
  @override
  _AllServicesPageState createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40,horizontal: 15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GridItem(
                    route: CleaningPage(),
                    image: Image.asset('assets/icons/cleaning.png',height: 64,),
                    title: 'Cleaning',
                  ),
                  GridItem(
                    route: CleaningPage(),
                    image: Image.asset('assets/icons/cleaning.png',height: 64,),
                    title: 'Cleaning',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

