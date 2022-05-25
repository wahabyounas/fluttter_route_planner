// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, avoid_print, unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:route_planner/model/login_model.dart';
import 'package:route_planner/model/setting.dart';

class APIService {
  SettingsManager settings = new SettingsManager();
  Future<AccessResponseModel> login(LoginRequestModel? requestModel) async {
    var basicAuth = settings.GetAuthBasic();
    var url = Uri.parse(
        "http://api.cwiztech.com:8080/v1/oauth/token?username=${requestModel?.username}&password=${requestModel?.password}&grant_type=password");
    final response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Basic $basicAuth',
      },
    );
    if (response.statusCode == 200) {
      print('1st API');
      var token1 = AccessResponseModel.fromJson(json.decode(response.body));
      var token = token1.token;
      var url2 = Uri.parse("http://api.cwiztech.com:8080/v1/login");
      Map data2 = {"application_CODE": "${settings.GetapplicationCODE()}"};
      final msg = jsonEncode(data2);
      var response2 = await http.post(url2,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: msg);
      print('2nd API');
      if (response2.statusCode == 200) {
        var response2_Json =
            LoginResponseModelL.fromJson(json.decode(response2.body));
        var Response_User_ID = (response2_Json.user_id);
        var Response_Application_ID = response2_Json.app_id;

        if (Response_Application_ID == settings.GetApplicationID()) {
          print('3rd API');
          var url3 = Uri.parse(
              "http://api.cwiztech.com:8080/v1/login/userprivileges/${Response_User_ID}");
          var application_ID = settings.GetApplicationID();
          Map data3 = {
            'application_ID': application_ID,
          };
          var body = json.encode(data3);
          var response3 = await http.post(
            url3,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              HttpHeaders.authorizationHeader: 'Bearer $token',
            },
            body: body,
          );
          if (response3.statusCode == 200) {
            return AccessResponseModel.fromJson(json.decode(response.body));
          } else {
            print('3rd Exception');
            return AccessResponseModel.fromJson(json.decode(response3.body));
          }
        } else {
          Map Error = {"error": "Invalid Application access"};
          var error = json.encode(Error);
          return AccessResponseModel.fromJson(json.decode(error));
        }
      } else {
        print('2nd Exception');
        return AccessResponseModel.fromJson(json.decode(response2.body));
      }
    } else {
      print('1st Exception');
      return AccessResponseModel.fromJson(json.decode(response.body));
    }
  }
}
