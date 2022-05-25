// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:route_planner/theme.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children:[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color:kPrimaryColor,
            ),
              accountName: const Text('Wahab Younas'),
              accountEmail: const Text('wahab@gmail.com'),
              ),
          ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
           ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            onTap: () => print('Rutes'),
          ), 
          ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            // ignore: avoid_print
            onTap: () => print('Rutes'),
          ),const Divider(),
           ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            onTap: () => print('Rutes'),
          ),
           ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            onTap: () => print('Rutes'),
          ), 
          ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            onTap: () => print('Rutes'),
          ),const Divider(),
           ListTile(
            leading: const Icon(Icons.alt_route_outlined),
            title: const Text('Routes'),
            onTap: () => print('Routes'),
          ),
        ],
      ),
    );
  }
}