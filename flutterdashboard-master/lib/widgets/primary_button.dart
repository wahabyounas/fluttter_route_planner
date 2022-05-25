// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, avoid_print, avoid_unnecessary_containers, must_be_immutable, unnecessary_new
import 'package:flutter/material.dart';
import 'package:route_planner/api/api_service.dart';
import 'package:route_planner/model/login_model.dart';
import 'package:route_planner/theme.dart';

class PrimaryButton extends StatelessWidget {
  final buttonText;
  final username;
  final password;
  LoginRequestModel loginRequestModel = new LoginRequestModel();
  PrimaryButton(
      {@required this.buttonText,
      @required this.username,
      @required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kPrimaryColor),
              child: Text(buttonText,
                  style: textButton.copyWith(color: kWhiteColor)),
            ),
            onPressed: () {
              print(username.text);
              print(password.text);
              loginRequestModel.username = username.text;
              loginRequestModel.password = password.text;
            }));
  }
}
