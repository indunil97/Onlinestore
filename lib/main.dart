import 'package:Shopping/login.dart';
import 'package:Shopping/models/user.dart';
import 'package:Shopping/services/auth.dart';
import 'package:Shopping/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './Comp/pages/homepage.dart';




void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:AuthService().user,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    ),
  );
  }
}

