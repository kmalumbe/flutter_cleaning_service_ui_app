import 'package:flutter/material.dart';

class TabIconData {

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  AnimationController animationController;

  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/icons/home.png',
      selectedImagePath: 'assets/icons/home.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/search.png',
      selectedImagePath: 'assets/icons/search.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/',
      selectedImagePath: 'assets/icons/',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/profileIcon.png',
      selectedImagePath: 'assets/icons/profileIcon.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
