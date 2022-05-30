// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:route_planner/theme.dart';
import 'package:route_planner/widgets/sidebar.dart';
import 'package:route_planner/widgets/bottom_navigation.dart';
import 'package:route_planner/pages/chat.dart';
import 'package:route_planner/pages/map.dart';
import 'package:route_planner/pages/profile.dart';
import 'package:route_planner/pages/dashboard.dart';


 class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentTab = 0;
  final List<Widget> screens =[
    Chat(),
    Profile(),
    MyMap()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {},
        backgroundColor: Color(0xFF3276b1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   MaterialButton(
                     minWidth: 40,
                     onPressed: (){
                       setState(() {
                         currentScreen = Dashboard();
                         currentTab = 0;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.dashboard,
                           color: currentTab == 0 ? Color(0xFF3276b1) : Colors.grey,
                         ),
                         Text(
                           'Dashboard',
                         style: TextStyle(color: currentTab == 0 ? Color(0xFF3276b1) : Colors.grey,),
                         )
                       ],
                     ),
                   ),
                   MaterialButton(
                     minWidth: 40,
                     onPressed: (){
                       setState(() {
                         currentScreen = Chat();
                         currentTab = 1;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.chat,
                           color: currentTab == 1 ? Color(0xFF3276b1) : Colors.grey,
                         ),
                         Text(
                           'Chat',
                         style: TextStyle(color: currentTab == 1 ? Color(0xFF3276b1) : Colors.grey,),
                         )
                       ],
                     ),
                   ),
                   
                 ],
               ),
                Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    MaterialButton(
                     minWidth: 40,
                     onPressed: (){
                       setState(() {
                         currentScreen = MyMap();
                         currentTab = 2;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.map,
                           color: currentTab == 2 ? Color(0xFF3276b1) : Colors.grey,
                         ),
                         Text(
                           'Map',
                         style: TextStyle(color: currentTab == 2 ? Color(0xFF3276b1) : Colors.grey,),
                         )
                       ],
                     ),
                   ),
                   MaterialButton(
                     minWidth: 40,
                     onPressed: (){
                       setState(() {
                         currentScreen = Profile();
                         currentTab = 3;
                       });
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(
                           Icons.account_box,
                           color: currentTab == 3 ? Color(0xFF3276b1) : Colors.grey,
                         ),
                         Text(
                           'Profile',
                         style: TextStyle(color: currentTab == 3 ? Color(0xFF3276b1) : Colors.grey,),
                         )
                       ],
                     ),
                   )
                 ],
               )
             ],
          ),
        ),
      ),
    );
  }
}