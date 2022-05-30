import 'package:flutter/material.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Center(
        child: Text('Maps Screen',
            style: TextStyle(
              fontSize: 40,
            )),
      ),
    );
  }
}
