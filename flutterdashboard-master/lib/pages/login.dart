// ignore_for_file: unused_import, duplicate_ignore, use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, unused_field, unnecessary_new, override_on_non_overriding_member, avoid_print, unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:route_planner/api/api_service.dart';
import 'package:route_planner/model/login_model.dart';
import 'package:route_planner/pages/ProgressHUD.dart';
import 'package:route_planner/pages/home.dart';
import 'package:route_planner/pages/reset_password.dart';
import 'package:route_planner/pages/signup.dart';
import 'package:route_planner/pages/dashboard.dart';
import 'package:route_planner/theme.dart';
import 'package:route_planner/widgets/login_form.dart';
import 'package:route_planner/widgets/bottom_navigation.dart';
import 'package:route_planner/widgets/primary_button.dart';

// ignore_for_file: unused_import
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isApiCallProcess = false;
  bool _isObscure = true;
  final myControllerUsername = TextEditingController();
  LoginRequestModel? loginRequestModel;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final myControllerPassword = TextEditingController();
  bool _checked = false;
  bool newValue = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        key: scaffoldKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              SizedBox(
                height: 100,
              ),
              Center(
                 child: Container(
                          child: new Image.asset(
                            'assets/uog.png',
                            height: 70.0,
                            fit: BoxFit.cover,
                          ),
                        ),
               ),
               SizedBox(
                 height: 70,
               ),
              Text(
                'Welcome Back',
                style: titleText,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'New to this app?',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //  LogInForm(),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: myControllerUsername,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: kTextFieldColor,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                ),
                              )),
                          TextFormField(
                              obscureText: _isObscure,
                              controller: myControllerPassword,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: kTextFieldColor,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: _isObscure
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: kTextFieldColor,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: kPrimaryColor,
                                          ),
                                  )))
                        ],
                      ))),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /* PrimaryButton(
                  buttonText: 'Log In',
                  username: myControllerUsername,
                  password: myControllerPassword),*/
              TextButton(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kPrimaryColor),
                    child: Text("Login",
                        style: textButton.copyWith(color: kWhiteColor)),
                  ),
                  onPressed: () {
                    print(myControllerUsername.text);
                    print(myControllerPassword.text);
                    loginRequestModel?.username = myControllerUsername.text;
                    loginRequestModel?.password = myControllerPassword.text;
                    if (validateAndSave()) {
                      //print(loginRequestModel?.toJson());

                      setState(() {
                        isApiCallProcess = true;
                      });

                      APIService apiService = new APIService();
                      apiService.login(loginRequestModel).then((value) {
                        if (value != null) {
                          setState(() {
                            isApiCallProcess = false;
                          });
                          if (value.error != null) {
                            if ("unauthorized" == value.error.toString()) {
                              final snackBar =
                                  SnackBar(content: Text("Invalid input...."));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            if ("invalid_token" == value.error.toString()) {
                              final snackBar = SnackBar(
                                  content: Text(
                                      "unauthorized to use this application"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                  content: Text(value.error.toString()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } else if (value.token != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHome()),
                            );
                          }
                        }
                      });
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   'Or log in with:',
              //   style: subTitle.copyWith(color: kBlackColor),
              // ),

              SizedBox(
                height: 30,
              ),
              //  Center(
              //    child: Container(
              //             child: new Image.asset(
              //               'assets/uog.png',
              //               height: 70.0,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //  ),
              //  LoginOption(),
             // BottomNav(),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
