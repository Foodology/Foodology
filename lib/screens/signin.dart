import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodology/screens/Home.dart';
import 'package:foodology/screens/authenticationFB.dart';
import 'package:foodology/screens/signup.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String error = '';
  final AuthService _auth = AuthService();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xff6AB6FF),
          body: Form(
            key: _globalKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 50/30,
                          child: Image.asset('images/logo.png')
                      ),

                      SizedBox(height: 110),

                      Container(
                        padding: EdgeInsets.only(left: 8, bottom: 8, top: 4, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 330,
                                  padding: EdgeInsets.all(9.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Colors.white,
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.white),
                                        hintText: 'Email',
                                      ),
                                      controller: email,
                                      validator: (email) {
                                        if (email.isEmpty) {
                                          return "Email can't be empty";
                                        } else {
                                          return null;
                                        }
                                      }
                                      )
                                ),
                              Container(
                                width: 330,
                                padding: EdgeInsets.all(9.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Colors.white,
                                        )
                                    )
                                ),
                                child: TextFormField(
                                    obscureText: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: 'Password',
                                    ),
                                    controller: password,
                                    validator: (password) {
                                      if (password.length < 6) {
                                        return "Password must be 6 or more characters long.";
                                      } else {
                                        return null;
                                      }
                                    }
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: 20),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              height: 50,
                              buttonColor: Colors.grey,
                              child: RaisedButton(
                                    child: Text('Login'),
                                    onPressed: () async {
                                      if(_globalKey.currentState.validate()){
                                      dynamic result = await _auth.signInWithEmailandPassword(email.toString().trim(), password.toString().trim());
                                      if(result == null){
                                      setState(() => error = 'Could not sign in with those credentials');
                                      }
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage()));
                                    }
                                  ),
                            ),
                           

                              SizedBox(width: 20),

                              RaisedButton(
                                child: Text('Register'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterPage()),
                                  );
                                },
                              )
                            ],
                          ),
                      ),
                        ]
                      ),
                ),
                ),
              ),
            );
  }
}