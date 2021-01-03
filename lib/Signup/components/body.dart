import 'package:circle_network_ftp/Login/login_screen.dart';
import 'package:circle_network_ftp/Signup/components/background.dart';
import 'package:circle_network_ftp/Signup/components/or_divider.dart';
import 'package:circle_network_ftp/Signup/components/social_icon.dart';
import 'package:circle_network_ftp/components/already_have_an_account_acheck.dart';
import 'package:circle_network_ftp/components/rounded_button.dart';
import 'package:circle_network_ftp/components/rounded_input_field.dart';
import 'package:circle_network_ftp/components/rounded_password_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller_email = TextEditingController();
  final _controller_password = TextEditingController();
  var email, password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                      return 'Please a valid Email';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    email = value;
                  },
                  controller: _controller_email,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.lightGreenAccent)),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Your Email",
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: TextField(
                  obscureText: true,
                  controller: _controller_password,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.lightGreenAccent)),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter Your Password",
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              // RoundedButton(
              //   text: "SIGNUP",
              //   press: () {},
              //
              // ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xFF6F35A5),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: FlatButton(
                    child: Text("SIGN UP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: (){

                  if(_formkey.currentState.validate())
                  {
                    print("successful");

                    return;
                  }else{
                    print("UnSuccessfull");
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              // Padding(
              //   padding:  EdgeInsets.only(top: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       SocalIcon(
              //         iconSrc: "assets/icons/facebook.svg",
              //         press: () {},
              //       ),
              //       SocalIcon(
              //         iconSrc: "assets/icons/twitter.svg",
              //         press: () {},
              //       ),
              //       SocalIcon(
              //         iconSrc: "assets/icons/google-plus.svg",
              //         press: () {},
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
