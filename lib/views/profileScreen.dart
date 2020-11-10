
import 'package:cleaning_service_ui_app/constants/appTheme.dart';
import 'package:cleaning_service_ui_app/views/profilePages/notificationsPage.dart';
import 'package:cleaning_service_ui_app/views/profilePages/orderHistoryPage.dart';
import 'package:cleaning_service_ui_app/views/profilePages/paymentSettings.dart';
import 'package:cleaning_service_ui_app/views/profilePages/profileSettings.dart';
import 'package:cleaning_service_ui_app/views/profilePages/savedServicesPage.dart';
import 'package:cleaning_service_ui_app/views/profilePages/scheduledOrdersPage.dart';
import 'package:cleaning_service_ui_app/views/windowCleaningPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userFullName = 'Kambala Malumbe'; //Todo: Get from DB

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.mainBackground,
        body: Container(
          child: SingleChildScrollView(
            child: Column( //Main column
              children: <Widget>[
                Container( //HEADER
                  padding: EdgeInsets.all(20),
//                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      //PROFILE PICTURE
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppTheme.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/afro-male.jpg'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      //PROFILE NAME
                      Text(userFullName,style: AppTheme.headline,),
                      SizedBox(height: 25,),
                      //MEMBERSHIP TYPE
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Icon(Icons.star,color: Colors.orange[400],size: 50,),
                              ],
                            ),
                            Text('Gold Member', style: TextStyle(color: AppTheme.grey),)
                          ],
                        )
                      ),
                      SizedBox(height: 30,),
                      // PROFILE STATISTICS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ProfileStatistic(number: 2, title: 'Orders',route: OrderHistoryPage(),),
                          ProfileStatistic(number: 1,title: 'Scheduled',route: ScheduledOrdersPage(),),
                          ProfileStatistic(number: 8,title: 'Saved',route: SavedServicesPage()),
                        ],
                      )
                    ],
                  )
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      decoration: BoxDecoration(
//                        color: AppTheme.mainBackground,
                      color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProfileButton(icon: Icons.notifications, iconColor: AppTheme.mainBlue, title: 'Notifications',route: NotificationsPage(),),
                          ProfileButton(icon: Icons.person, iconColor: AppTheme.mainBlue, title: 'Profile Settings',route: ProfileSettings(),),
                          ProfileButton(icon: Icons.credit_card, iconColor: AppTheme.mainBlue, title: 'Payment Settings',route: PaymentSettings(),),
                          ProfileButton(icon: Icons.clear, iconColor: AppTheme.mainBlue, title: 'Logout',route: WindowCleaningPage(),),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileStatistic extends StatelessWidget {
  ///Class representing profile statistics buttons.
  ///E.g Orders, Scheduled, Saved.
  final int number;
  final String title;
  final Widget route;

  ProfileStatistic({
   @required this.number,
   @required this.title,
    @required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
      },
      child: Container(
        height: 74,
        width: 74,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppTheme.white,
//        boxShadow: [BoxShadow(
//            offset: Offset(0,0),
//            blurRadius: 0,
//            spreadRadius: 0,
//            color: Colors.grey,
//          )],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(number.toString(),
            style: TextStyle(),
            ),
            Text(title,
            style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  ///Class representing buttons routed to other pages on the profile page
  ///E.g Notifications, Profile Settings etc
  final Widget route;
  final IconData icon;
  final String title;
  final Color iconColor;

  ProfileButton({
    @required this.route,
    @required this.icon,
    @required this.title,
    @required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
      },
      child: Row(
        children: <Widget>[
          Container(
              height: 60,
              width: 20,
              margin: EdgeInsets.only(right: 20,left: 20),
              child: Center(
                  child: Icon(icon,color: iconColor,)
              )
          ),
          Container(
              height: 20,
              width: 200,
              margin: EdgeInsets.only(right: 30),
              child: Text(title, style: TextStyle(color: Colors.grey,fontSize: 18),textAlign: TextAlign.left,)
          ),
          Container(
              height: 20,
              width: 20,
              child: Center(
                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20,)
              )
          ),
        ],
      ),
    );
  }
}
