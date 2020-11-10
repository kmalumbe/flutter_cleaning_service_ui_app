import 'package:cleaning_service_ui_app/constants/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WindowCleaningPage extends StatefulWidget {
  @override
  _WindowCleaningPageState createState() => _WindowCleaningPageState();
}

class _WindowCleaningPageState extends State<WindowCleaningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  height: 200,
                  child: Header(),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.85,
                  minChildSize: 0.85,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                        height: MediaQuery.of(context,).size.height - MediaQuery.of(context).padding.top,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
//                                topRight: Radius.circular(40)
                            ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 25,),
                            Padding(
                              padding: const EdgeInsets.only(left:24.0),
                              child: Text('Window Cleaning',
                                style: AppTheme.headline,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left:24.0),
                              child: Text('Where?',style: AppTheme.title,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:26.0,vertical: 12),
                              child: InkWell(
                                onTap: (){},
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppTheme.mainBackground,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Istanbul'),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:24.0,top: 10),
                              child: Text('Time',style: AppTheme.title,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20,right: 15),
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppTheme.mainBackground,
                                      ),
                                      child: InkWell(
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20,left: 15),
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppTheme.mainBackground,
                                      ),
                                      child: InkWell(

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                    );
                  }
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
//        color: AppTheme.mainBlue,
      image: DecorationImage(
        image: AssetImage('assets/icons/window-cleaner-banner.png'),
      )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20,left: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppTheme.grey,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(50),
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.mainAccent,
                          shape: BoxShape.circle,
                        ),
                      ),

                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.mainBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(child: Icon(Icons.arrow_back_ios),)
                ],
              ),
            ),
          ),
          Text('',
            style: AppTheme.title,
          ),

        ],
      ),
    );
  }
}

