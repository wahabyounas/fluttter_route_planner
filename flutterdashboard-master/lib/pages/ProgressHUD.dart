// ignore_for_file: unused_import, duplicate_ignore, use_key_in_widget_constructors, prefer_const_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:route_planner/model/login_model.dart';
import 'package:route_planner/pages/reset_password.dart';
import 'package:route_planner/pages/signup.dart';
import 'package:route_planner/theme.dart';
import 'package:route_planner/widgets/login_form.dart';
import 'package:route_planner/widgets/primary_button.dart';

// ignore_for_file: unused_import

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;

  ProgressHUD({
    Key? key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(child: CircularProgressIndicator()),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
