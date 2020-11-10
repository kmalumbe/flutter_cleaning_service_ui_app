import 'package:cleaning_service_ui_app/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/appTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.mainBackground,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ));
    return GestureDetector(
      onTap: (){
        //Method to close keyboard whenever another part of screen is tapped
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus && currentFocus.focusedChild !=null){
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Cleaning Service App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
//      home: BottomBarView(),
        home: HomeScreen(),
      ),
    );
  }
}

