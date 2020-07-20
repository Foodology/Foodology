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
  bool _btnEnabled = false;


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
                  Container(
                    padding: EdgeInsets.only(left: 8, bottom: 8, top: 4, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 800,
                            child: Image.asset('images/logo.png'),
                          ),
                          SizedBox(height: 80),
                          Container(
                              width: 330,
                              padding: EdgeInsets.all(7),
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
                                    fontSize: 17,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Email',
                                  ),
                                  controller: email,
                                  autovalidate: _btnEnabled,
                                  validator: (String email) {
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
                                  fontSize: 17,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Password',
                                ),
                                controller: password,
                                autovalidate: _btnEnabled,
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


                  SizedBox(height: 50),

                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(30),
                            elevation: 6.0,
                            color: Colors.white54,
                            child: MaterialButton(
                              minWidth: 200,
                                height: 45,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text('Login'),
                                onPressed: () async {
                                  if(_globalKey.currentState.validate()) {
                                    dynamic result = await _auth.signInWithEmailandPassword(email.text.toString().trim(), password.text.toString().trim());
                                    if(result != null){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage()));
                                    }
                                  }
                                }
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 175,
                                height: 175,
                                child: FittedBox(child: Text(
                                    "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),), fit: BoxFit.contain),
                              ),
                              SizedBox(width: 10),
                              Container(
                                color: Colors.transparent,
                                width: 60,
                                height: 60,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: InkWell(child: Text("Register"), onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => RegisterPage()));
                                  },),
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}