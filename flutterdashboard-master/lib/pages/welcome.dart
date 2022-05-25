// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:route_planner/theme.dart';
import 'package:route_planner/widgets/sidebar.dart';
import 'package:route_planner/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: SideBar(),
      appBar: AppBar(
        title: Text("Route Planner"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
            Icons.more_vert
        ),
      )
    ),
        ],
      ),
      body:SingleChildScrollView(
       child: Column(
         children: <Widget> [
           BottomNavBarFb2(),
         ],
       ),
      ),
    );
  }
}
