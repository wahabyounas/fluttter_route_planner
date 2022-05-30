// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:route_planner/theme.dart';
import 'package:route_planner/widgets/sidebar.dart';
import 'package:route_planner/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:route_planner/pages/chat.dart';
import 'package:route_planner/pages/map.dart';
import 'package:route_planner/pages/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("Route Planner"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: Text('Logout'),
                  )
                ]),
          )
        ],
      ),
      // body:SingleChildScrollView(
      //  child: Column(
      //    children: <Widget> [
      //      BottomNavBarFb2(),
      //    ],
      //  ),
      // ),
    );
  }
}
