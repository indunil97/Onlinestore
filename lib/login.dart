import 'package:Shopping/Comp/pages/homepage.dart';
import 'package:Shopping/services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = "";
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0.5, 0, 0),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                  child: Text(
                    "Hello",
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 80.0, 0.0, 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(18.0, 110.0, 0.0, 0.0),
                        child: Text("There",
                            style: TextStyle(
                                fontSize: 80, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 300.0, left: 20.0, right: 20.0),
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
                          decoration: InputDecoration(
                              labelText: "E-Mail",
                              labelStyle: TextStyle(color: Colors.grey), //font
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.greenAccent))),
                        ),
                        TextFormField(
                            validator: (val) =>
                                val.length < 5 ? "at least 5 chars" : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(color: Colors.grey), //font
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent)))),
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
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.signIn(email, password);
                              if (result == null) {
                                setState(() =>
                                    error = 'login faild'); //have to show this
                              }
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
                            dynamic result = await _auth.signInAno();
                            if (result == null) {
                              print("error in signing in");
                            } else {
                              print("sign in");
                              print(result.uid);
                            }
                          },
                          child: Container(
                            width: 200,
                            height: 40.0,
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
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
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
                        padding: EdgeInsets.fromLTRB(18.0, 50.0, 0.0, 0.0),
                        child: Text("Signup",
                            style: TextStyle(
                                fontSize: 80, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 260.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: "User name",
                              labelStyle: TextStyle(color: Colors.grey), //font
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.greenAccent))),
                        ),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'enter email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle:
                                    TextStyle(color: Colors.grey), //font
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent)))),
                        TextFormField(
                            validator: (val) =>
                                val.length < 5 ? "at least 5 chars" : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(color: Colors.grey), //font
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent)))),
                        SizedBox(height: 60.0),
                        Text(error, style: TextStyle(color: Colors.red)),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.signUp(email, password);
                              if (result == null) {
                                setState(() => error =
                                    'Please supply valid values'); //have to show this
                              } else
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstPage()));
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
    );
  }
}
