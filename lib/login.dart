import 'package:Shopping/Comp/pages/homepage.dart';
import 'package:Shopping/Exhandling/firebase-auth-helper.dart';
import 'package:Shopping/services/auth.dart';
import 'package:Shopping/shared/loading.dart';
import 'package:flutter/material.dart';
import './shared/constant.dart';
import 'Exhandling/auth-exception-handler.dart';
import 'Exhandling/auth-result-status.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  String error = "";
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0.5, 0, 0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                          child: Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: 80, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 80.0, 0.0, 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(18.0, 110.0, 0.0, 0.0),
                                child: Text("There",
                                    style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 300.0, left: 20.0, right: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                    validator: (val) =>
                                        val.isEmpty ? 'enter email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    decoration: textFieldDecoration.copyWith(
                                        labelText: "E-Mail")),
                                TextFormField(
                                    validator: (val) => val.length < 5
                                        ? "at least 5 chars"
                                        : null,
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                    decoration: textFieldDecoration.copyWith(
                                        labelText: "Password")),
                                SizedBox(height: 15),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Forget Password",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Text(error,
                                    style: TextStyle(color: Colors.red)),
                                SizedBox(height: 10.0),
                                InkWell(
                                  onTap: () async {
                                   
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      final status = await FirebaseAuthHelper()
                                          .login(email: email, pass: password);
                                      if (status ==
                                          AuthResultStatus.successful) {
                                        
                                        //have to show this
                                      } else {
                                        final errorMsg = AuthExceptionHandler
                                            .generateExceptionMessage(status);
                                        _showAlertDialog(errorMsg);
                                      }
                                      ;
                                    }
                                  },
                                  child: Container(
                                    height: 50.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      shadowColor: Colors.black,
                                      color: Colors.black,
                                      elevation: 7.0,
                                      child: Center(
                                          child: Text("LOGIN",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Container(
                                    height: 50.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      shadowColor: Colors.black,
                                      color: Colors.black,
                                      elevation: 7.0,
                                      child: Center(
                                          child: Text("Create Account",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () async {
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signInAno();

                                    if (result == null) {
                                      print("error in signing in");
                                      setState(() => loading = false);
                                    } else {
                                      print("sign in");
                                      print(result.uid);
                                    }
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 40.0,
                                    margin: EdgeInsets.only(bottom: 40),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      shadowColor: Colors.black,
                                      color: Colors.pinkAccent,
                                      elevation: 7.0,
                                      child: Center(
                                          child: Text("Login Anonimusly",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  _showAlertDialog(errorMsg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Login Failed',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(errorMsg),
          );
        });
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0.5, 0, 0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 80.0, 0.0, 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(18.0, 50.0, 0.0, 0.0),
                                child: Text("Signup",
                                    style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 260.0, left: 20.0, right: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextField(
                                    decoration: textFieldDecoration.copyWith(
                                        labelText: "User name")),
                                TextFormField(
                                    validator: (val) =>
                                        val.isEmpty ? 'enter email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    decoration: textFieldDecoration.copyWith(
                                        labelText: "E-Mail")),
                                TextFormField(
                                    validator: (val) => val.length < 5
                                        ? "at least 5 chars"
                                        : null,
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                    decoration: textFieldDecoration.copyWith(
                                        labelText: "Password")),
                                SizedBox(height: 60.0),
                                Text(error,
                                    style: TextStyle(color: Colors.red)),
                                InkWell(
                                  onTap: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      final status = await FirebaseAuthHelper()
                                          .createAccount(email: email, pass: password);
                                      if (status ==
                                          AuthResultStatus.successful) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FirstPage()),
                                            (r) => false);
                                        //have to show this
                                      } else {
                                        final errorMsg = AuthExceptionHandler
                                            .generateExceptionMessage(status);
                                        _showAlertDialog(errorMsg);
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 50.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      shadowColor: Colors.black,
                                      color: Colors.black,
                                      elevation: 7.0,
                                      child: Center(
                                          child: Text("Signup",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 40),
                                    height: 50.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      shadowColor: Colors.black,
                                      color: Colors.black,
                                      elevation: 7.0,
                                      child: Center(
                                          child: Text("Go Back",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  _showAlertDialog(errorMsg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Login Failed',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(errorMsg),
          );
        });
  }
}
