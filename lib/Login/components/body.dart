import 'package:circle_network_ftp/Signup/signup_screen.dart';
import 'package:circle_network_ftp/components/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'background.dart';


class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller_email=TextEditingController();
  final _controller_password=TextEditingController();
  var email,password;

  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.fromLTRB(40,10,40,10),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter';
                    }
                    if (!RegExp("^[a-zA-Z0-9+d_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
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
                      borderSide: BorderSide(color: Colors.transparent)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Your Email",
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40,10,40,10),
                child: TextField(
                  obscureText: true,
                  controller: _controller_password,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.transparent)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter Your Password",
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),

                ),
              ),

              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xFF6F35A5),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: FlatButton(
                    child: Text("LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: (){

                  if(_formkey1.currentState.validate())
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
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
