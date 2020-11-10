import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:cleaning_service_ui_app/constants/appTheme.dart';
import 'package:cleaning_service_ui_app/views/profileScreen.dart';
import 'package:cleaning_service_ui_app/views/settingsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cleaningPage.dart';
import 'windowCleaningPage.dart';

import 'bottomBarView.dart';
import 'exploreScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeDrawer = '';
  double activeDrawerElevation = 0.5;
  var navIndex = 0; // index for navigation bar
  final pages = List<Widget>.unmodifiable([
    Dashboard(),
    ExploreScreen(),
    ProfileScreen(),
  ]);
  final _iconList = List<IconData>.unmodifiable([
    CupertinoIcons.home,
    CupertinoIcons.search,
    CupertinoIcons.person,








//  Icons.home,

//    Icons.person,
  ]);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: AppTheme.mainBackground,

      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //User Profile image
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.mainBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height:56,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: AppTheme.mainBackground,
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/afro-male.jpg'),
                                  ),
                                ),

                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Kambala Malumbe',style: AppTheme.title,),
                          Text('ksmalumbe@gmail.com',),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  RawMaterialButton(
                    onPressed: (){
                      setState(() {
                        activeDrawer = 'settings';
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage(),));
                    },
                    fillColor: activeDrawer=='settings' ? AppTheme.mainBackground : AppTheme.white,
                    elevation: activeDrawer == 'settings'? activeDrawerElevation : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(CupertinoIcons.settings),
                          Text('Settings'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  RawMaterialButton(
                    onPressed: (){
                      setState(() {
                        activeDrawer = 'Wallet';
                      });
                    },
                    elevation: activeDrawer == 'Wallet'? activeDrawerElevation : 0,
                    fillColor: activeDrawer=='Wallet' ? AppTheme.mainBackground : AppTheme.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.credit_card),
                          Text('Wallet'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  RawMaterialButton(
                    onPressed: (){
                      setState(() {
                        activeDrawer='History';
                      });
                    },
                    elevation: activeDrawer == 'History'? activeDrawerElevation : 0,
                    fillColor: activeDrawer=='History' ? AppTheme.mainBackground : AppTheme.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(CupertinoIcons.time),
                          Text('History'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  RawMaterialButton(
                    onPressed: (){
                      setState(() {
                        activeDrawer = 'Notifications';
                      });
                    },
                    elevation: activeDrawer == 'Notifications'? activeDrawerElevation : 0,
                    fillColor: activeDrawer=='Notifications' ? AppTheme.mainBackground : AppTheme.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(CupertinoIcons.bell),
                          Text('Notifications'),
                        ],
                      ),
                    ),
                  ),

                ],

              ),
            ),
          ),
          body: pages[navIndex],
          bottomNavigationBar: NavBar(
            icons: _iconList,
            onPressed: (i) => setState(() => navIndex = i),
            activeIndex: navIndex,
          )),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
//          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              //GRID
              child: Column(
                children: <Widget>[
                  MainHeader(),
                  SizedBox(height: 20,),
                  //FIRST ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GridItem(
                        route: CleaningPage(),
                        image: Image.asset('assets/icons/cleaning.png',width: 60, height: 60,),
                        title: 'House Cleaning',
                      ),
                      GridItem(
                        route: WindowCleaningPage(),
                        image: Image.asset('assets/icons/002-window.png',width: 60, height: 60,),
                        title: 'Window Cleaning',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //SECOND ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GridItem(
                        route: ExploreScreen(),
                        image: Image.asset('assets/icons/005-washing-clothes.png',width: 60, height: 60,),
                        title: 'Wash & Fold',
                      ),
                      GridItem(
                        route: ExploreScreen(),
                        image: Image.asset('assets/icons/026-dry.png',width: 60, height: 60,),
                        title: 'Dry Cleaning',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GridItem(
                        route: ExploreScreen(),
                        image: Image.asset('assets/icons/022-vacuum.png',width: 60, height: 60,),
                        title: 'Couch & Carpet',
                      ),
                      GridItem(
                        route: ExploreScreen(),
                        image: Image.asset('assets/icons/018-housekeeping.png',width: 60, height: 60,),
                        title: 'Cleaning',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),


                ],
              ),
            ),
              //Top Text
          ),
        )
    );
  }
}

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.mainBackground,
//      height: 240,
      padding: EdgeInsets.all(24),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical:14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ///Menu Button
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppTheme.mainBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.white,),
                    onPressed: (){
                    },
                  ),
                ),
                ///User Button
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppTheme.mainBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height:42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: AppTheme.mainBackground,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage('assets/images/afro-male.jpg'),
                            ),
                          ),

                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Text('Hi User',style: AppTheme.title,textAlign: TextAlign.left,),
          ),
          Text('What Services are you looking for?',style: AppTheme.title, textAlign: TextAlign.left,),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Widget route;
  final String title;
  final Image image;

  GridItem({
    @required this.route,
    @required this.image,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => route));
        },
        borderRadius: BorderRadius.circular(5),
//                        splashColor: Colors.lightBlueAccent[50],
        child: Container(
          height: 132,
          width:  132,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.mainAccent
            ),
            borderRadius: BorderRadius.circular(5),
            color: AppTheme.mainBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//                Icon(icon,size: 64,color: AppTheme.iconColor,),
                image,
                SizedBox(height: 12,),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w400,letterSpacing: 0.3,fontSize: 16,),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
    );
  }


}



///Custom NavBar Widget
class NavBar extends StatefulWidget {
//  final _titles = ['Home','Explore','Profile'];
//  final _colors = [Colors.red,Colors.lime,Colors.teal];
  const NavBar(
      {@required this.icons,
      @required this.onPressed,
      @required this.activeIndex})
      : assert(icons != null);
  final List<IconData> icons;
  final Function(int) onPressed;
  final int activeIndex;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  double beaconRadius;
  double iconScale = 1;
  final double maxBeaconRadius = 30;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    beaconRadius = 0;
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(NavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeIndex != widget.activeIndex) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    _controller.reset();
    final _curve = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Tween<double>(begin: 0, end: 1).animate(_curve)
      ..addListener(() {
        setState(() {
          beaconRadius = maxBeaconRadius * _curve.value;
          if(beaconRadius == maxBeaconRadius){
            beaconRadius = 0;
          }
          if (_curve.value < 0.5){
            iconScale = 1 + _curve.value;
          }else{
            iconScale = 2 - _curve.value;
          }
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0,1.0),
            blurRadius: 1.5,
          )
        ],

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (var i = 0; i < widget.icons.length; i++)
            _NavBarItem(
              isActive: i == widget.activeIndex,
              iconData: widget.icons[i],
              iconScale: iconScale,
              onPressed: ()=>widget.onPressed(i),
              beaconRadius: beaconRadius,
              maxBeaconRadius: maxBeaconRadius,
            )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final bool isActive;
  final double beaconRadius;
  final double maxBeaconRadius;
  final double iconScale;
  final IconData iconData;
  final VoidCallback onPressed;

  _NavBarItem({
    @required this.isActive,
    @required this.beaconRadius,
    @required this.maxBeaconRadius,
    @required this.iconScale,
    @required this.iconData,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BeaconPainter(
        beaconRadius: isActive ? beaconRadius : 0,
        maxBeaconRadius: maxBeaconRadius,
        beaconColor: Colors.tealAccent,
      ),
      child: GestureDetector(
        child: Transform.scale(
          scale: isActive ? iconScale: 1,
          child: Icon(iconData,
            color: isActive ? AppTheme.mainBlue : AppTheme.greyBackground,
            size: 34,
          ),
        ),
        onTap: onPressed,

      ),
    );
  }
}


class BeaconPainter extends CustomPainter {
  final double beaconRadius;
  final double maxBeaconRadius;
  final Color beaconColor;
  final Color endColor;
  final bool isActive;
  BeaconPainter({
    @required this.beaconRadius,
    @required this.maxBeaconRadius,
    @required this.beaconColor,
    this.isActive=false
  }) : endColor = Color.lerp(beaconColor, Colors.white, 0.7);
  @override
  void paint(Canvas canvas, Size size) {
    if (beaconRadius == maxBeaconRadius) {
      return;
    }
    var animationProgress = beaconRadius / maxBeaconRadius;
    double strokeWidth = beaconRadius < maxBeaconRadius * 0.5
        ? beaconRadius
        : maxBeaconRadius - beaconRadius;
    final paint = Paint()
      ..color = Color.lerp(beaconColor, endColor, beaconRadius)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(12, 12), beaconRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


