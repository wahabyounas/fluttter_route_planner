// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_new, avoid_print
import 'package:flutter/material.dart';
import 'package:route_planner/model/login_model.dart';
import 'package:route_planner/theme.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = true;
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  LoginRequestModel loginRequestModel = new LoginRequestModel();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        borderSide: BorderSide(color: kPrimaryColor),
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
                      ),
                    ))
              ],
            )));
  }

  /* Padding buildInputForm(String label, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: pass ? _isObscure : false,

        onSaved: (input) {
          if (label == "Email") {
            loginRequestModel.email = input;
            print(input);
            print("pppppppppppppppppp");
          } else if (label == "Password") {
            loginRequestModel.password = input;
            print(input);
            print("11111111");
          }
        },

        //controller: myControllerUsername

        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
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
                  )
                : null),
      ),
    );
  }
  */
}
