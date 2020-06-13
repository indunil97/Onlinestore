

import 'package:Shopping/Comp/pages/homepage.dart';
import 'package:Shopping/authenticate.dart';
import 'package:Shopping/models/user.dart';
import 'package:Shopping/services/auth.dart';
import 'package:Shopping/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("user");
    
    if (user != null){
      return FirstPage();
    }else{
      return Authenticate();
    }
  
  }
}