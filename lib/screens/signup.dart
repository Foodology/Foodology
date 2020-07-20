import 'package:flutter/material.dart';
import 'package:foodology/screens/authenticationFB.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String error = '';
  final AuthService _auth = AuthService();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Form(
          key: _globalKey,
          child: Center(
            child: Column(
              children: [
                Image.asset('images/logo.png'),

                SizedBox(height:20),

                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                        ),
                      ),
                    ),
                    controller: email,
                    validator: (email) {
                      if (email.isEmpty) {
                        return "Email can't be empty";
                      } else {
                        return null;
                      }
                    }
                ),

                SizedBox(height: 20),

                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                        ),
                      ),
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

                SizedBox(height: 20),

                RaisedButton(
                    child: Text('Register'),
                    onPressed: () async {
                      if (_globalKey.currentState.validate()) {
                        print(email.text.trim());
                        print(password.text.trim());
                        dynamic result = await _auth.registerWithEmailandPassword(email.text.trim(), password.text.trim());
                        if (result == null) {
                          setState(() =>
                          error = 'Could not sign in with those credentials');
                        }
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}