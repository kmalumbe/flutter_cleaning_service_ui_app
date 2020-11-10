import 'package:cleaning_service_ui_app/constants/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CleaningPage extends StatefulWidget {
  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  int roomCounter = 1;
  void updateRoomCounter(String action){
    if(action=='up'){
      if(roomCounter<10)
      setState(() {
        roomCounter++;
      });
    }else if(action == 'down'){
      if(roomCounter>1)
      setState(() {
        roomCounter--;
      });
    }
  }

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
                  height: 200,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                                child: Text('House Cleaning',
                                  style: AppTheme.headline,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(height: 30,),
                              ItemTitle(title: 'Where?',),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                padding: EdgeInsets.symmetric(horizontal:26.0,vertical: 12),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.mainBackground,
                                ),
                                child: GestureDetector(
                                  onTap: (){

                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    decoration: BoxDecoration(
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
                              ItemTitle(title: 'What time?',),
                              //TIME ROW
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: TimeButton(title: 'Start'),
                                    ),
                                    Expanded(
                                      child: TimeButton(title: 'End'),
                                    ),
                                  ],
                                ),
                              ),
                              ItemTitle(title: 'How many rooms?',),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                padding: EdgeInsets.symmetric(horizontal:26.0,vertical: 12),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.mainBackground,
                                ),
                                child: GestureDetector(
                                  onTap: (){

                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        roomCounter == 1 ? Text('') :
                                        IconButton(
                                          icon: Icon(Icons.arrow_drop_down),
                                          onPressed: (){
                                            updateRoomCounter('down');
                                          },
                                        ),
                                        Text(roomCounter.toString()),
                                        roomCounter == 10 ? Text('') :
                                        IconButton(
                                          icon: Icon(Icons.arrow_drop_up),
                                          onPressed: (){
                                            updateRoomCounter('up');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 170,),


                            ],
                          ),
                        ),

                      );
                    }
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: AppTheme.mediumBoxBorderRadius,
                          color: AppTheme.mainBackground,
                          boxShadow: [
//                            BoxShadow(
//                              offset: Offset(0, 1),
//                              blurRadius: 0,
//                              spreadRadius: 0,
//                              color: Colors.grey,
//                            )
                          ]
                      ),
                      child: GestureDetector(
                        child: Center(child: Text('Make order',style: AppTheme.title,),),
                        onTap: (){

                        },

                      )
                  ),
                )
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
            image: AssetImage('assets/icons/girl-vacuuming.png'),
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

class TimeButton extends StatelessWidget {

  final String title;
  final Widget route;


  TimeButton({ //CONSTRUCTOR
    @required this.title,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 15),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.mainBackground,
      ),
      child: GestureDetector(
        onTap: (){},
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class ItemTitle extends StatelessWidget {
  /// Title widget
  final String title;
  ItemTitle({
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(//Title
      padding: const EdgeInsets.only(left:24.0,top: 10),
      child: Text(title,style: AppTheme.title,),
    );
  }
}


