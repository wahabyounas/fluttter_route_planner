// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_if_null_operators, non_constant_identifier_names

import 'package:flutter/material.dart';

class AccessResponseModel {
  final String? token;
  final String? error;

  AccessResponseModel({this.token, this.error});

  factory AccessResponseModel.fromJson(Map<String, dynamic> json) {
    return AccessResponseModel(
      token: json["access_token"] != null ? json["access_token"] : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class LoginResponseModelL {
  final int? user_id;
  final int? app_id;
  final String? error;

  LoginResponseModelL({this.user_id, this.app_id, this.error});

  factory LoginResponseModelL.fromJson(Map<String, dynamic> json) {
    return LoginResponseModelL(
      user_id: json["user_ID"] != null ? json["user_ID"] : "",
      app_id: json["application_ID"] != null ? json["application_ID"] : "",
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username?.trim(),
      'password': password?.trim(),
    };

    return map;
  }
}
