
import 'package:cleaning_service_ui_app/constants/appTheme.dart';
import 'package:cleaning_service_ui_app/views/profilePages/notificationsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'explorePages/allServicesPage.dart';


class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //Search Text Field
  String searchValue;
  FocusNode searchNode = FocusNode(); //
  TextEditingController searchController;

  //Navigation
  var tagIndex = 0; // index for navigation bar
  final explorePages = List<Widget>.unmodifiable([
    AllServicesPage(),
    NotificationsPage(),
    AllServicesPage(),
  ]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  //SEARCH BAR
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.mainBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 14,

                        ),
                        decoration: InputDecoration(
                          icon: Icon(CupertinoIcons.search, color: AppTheme.customTextColor,),
                          border: InputBorder.none,
                          fillColor: AppTheme.mainBackground,
                          hintText: 'E.g. Carpet cleaning, window cleaning etc',
                          labelText: 'Search',
                          labelStyle: TextStyle(color: AppTheme.customTextColor,fontSize: 18),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          alignLabelWithHint: true,
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (text){
                            searchValue = text;
                        },
                        onEditingComplete: (){

                        },
                        onSubmitted: (searchValue){
                          print(searchValue);
                          FocusScope.of(context).unfocus();
                        },
                        toolbarOptions: ToolbarOptions(
                          copy: true,
                          cut: true,
                          paste: false,
                          selectAll: true,
                        ),
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        autofocus: false,
                        textInputAction: TextInputAction.search,
                        maxLines: 1,
                        focusNode: searchNode,
                        textCapitalization: TextCapitalization.sentences,

                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  //EXPLORE TAGS
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ExploreTag(title: 'All',),
                        ExploreTag(title: 'New',),
                        ExploreTag(title: 'Popular',),
                        ExploreTag(title: 'Recent',),
                        ExploreTag(title: 'Cleaning',),
                        ExploreTag(title: 'Professional',),
                        ExploreTag(title: 'Quick',),
                        ExploreTag(title: 'New',),
//                      categoryButton(Tag.all, true),
//                      categoryButton(Tag.cleaning, true),
//                      categoryButton(Tag.professional, true),
//                      categoryButton(Tag.popular, true),
//                      categoryButton(Tag.all, true),
                      ],
                    ),
                  ),
                  Container(
                    child: explorePages[tagIndex],
                  )

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}


class ExploreTag extends StatefulWidget {

  final String title;
  ExploreTag({
   @required this.title,
  });

  @override
  _ExploreTagState createState() => _ExploreTagState();
}

class _ExploreTagState extends State<ExploreTag> {
  //Navigation
  bool isTagActive = false;

  @override
  void initState() {
    isTagActive = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isTagActive = true;
        });
      },
      child: Container(
        height: 30,
//      width: 60,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: isTagActive ? AppTheme.mainBackground : AppTheme.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}

enum Tag{
  all,
  popular,
  recent,
  cleaning,
  professional,
  quick,

}

Widget categoryButton(Tag tag,bool isSelected){

  String txt = '';
  switch(tag){

    case Tag.all:
      txt = 'All';
      break;
    case Tag.popular:
      txt = 'Popular';
      break;
    case Tag.recent:
      txt = 'Recent';
      break;
    case Tag.cleaning:
      txt = 'Cleaning';
      break;
    case Tag.professional:
      txt = 'Professional';
      break;
    case Tag.quick:
      txt = 'Quick';
      break;
  }
  return  GestureDetector(
    onTap: (){
      isSelected = false;
    },
    child: Container(
      margin: EdgeInsets.only(right: 10),
      height: 30,
//      width: 60,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.mainBackground : AppTheme.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(txt),
      ),
    ),
  );

}

