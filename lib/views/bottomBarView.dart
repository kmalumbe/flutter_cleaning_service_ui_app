import 'dart:math' as math;
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//class BottomBarView extends StatefulWidget {
//  const BottomBarView(
//      {Key key, this.tabIconsList, this.changeIndex})
//      : super(key: key);
//
//  final Function(int index) changeIndex;
//  final List<TabIconData> tabIconsList;
//  @override
//  _BottomBarViewState createState() => _BottomBarViewState();
//}

//class _BottomBarViewState extends State<BottomBarView>
//    with TickerProviderStateMixin {
//  AnimationController animationController;
//
//  @override
//  void initState() {
//    animationController = AnimationController(
//      vsync: this,
//      duration: const Duration(milliseconds: 1000),
//    );
//    animationController.forward();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(    );
//  }
//
//}

class BottomBarView extends StatefulWidget {
  final titles = ['Home', 'Explore', 'Profile'];
  final colors = [Colors.red, Colors.lime, Colors.teal];
  final icons = [
    CupertinoIcons.home,
    CupertinoIcons.search,
    CupertinoIcons.person
  ];
  BottomBarView({Key key}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  AnimationController animationController;
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView(
            controller: _pageController,
            children:
                widget.colors.map((Color c) => Container(color: c)).toList(),
            onPageChanged: (page) {},
          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Colors.white,
          defaultBubbleColor: Colors.blue,
          onTap: (index) {
            _pageController.animateToPage(index,
                curve: Curves.easeInOutQuad,
                duration: Duration(milliseconds: 500));
          },
          items: widget.titles.map((title) {
            var index = widget.titles.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
              icon: getIcon(index, color),
              activeIcon: getIcon(index, Colors.white),
              bubbleColor: color,
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
        ));
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }
}
