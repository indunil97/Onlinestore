import 'package:Shopping/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import './homepage/gridView.dart';
import './homepage/horizontal_cat.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    Widget imageCar = Container(
        height: 0.5 * height,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/car/2.jpg'),
            AssetImage('assets/car/3.jpg'),
            AssetImage('assets/car/4.jpg'),
            //   AssetImage('assets/car/5.jpg'),
            //   AssetImage('assets/car/6.jpg'),
            //   AssetImage('assets/car/7.jpg'),
            //   AssetImage('assets/car/8.jpg'),
          ],
          autoplay: false,
          animationCurve: Curves.easeIn,
          animationDuration: Duration(milliseconds: 1000),
        ));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Container(
          child: Text(
            'La Rosa',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Italianno',
              fontSize: 40,
            ),
          ),
          alignment: Alignment.center,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            accountName: Text('abc95'),
            accountEmail: Text('abc95@ymail.com'),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50.0,
                    ))),
          ),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: Text('Home'),
              leading: Icon(Icons.home),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: Text('Orders'),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: Text('Cart'),
              leading: Icon(Icons.shopping_cart),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: Text('Categories'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: Text('Favourites'),
              leading: Icon(Icons.favorite),
            ),
          ),
          Divider(),
          InkWell(
            child: ListTile(
              onTap: () {},
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () async {
                await _auth.signOut();
              },
              title: Text('logOut'),
              leading: Icon(Icons.help),
            ),
          ),
        ],
      )),

      //body
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                imageCar,
                HorizontalList(),
              ],
            ),
            Divider(),
            SizedBox(height: 1),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(6, 1, 0, 4),
              child: Container(
                height: 0.05 * height,
                width: 0.3 * width,
                alignment: Alignment.center,
                padding: EdgeInsets.all(2.0),
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10.0),
                //     boxShadow: [
                //       BoxShadow(
                //           color: Colors.grey.withOpacity(0.6),
                //           spreadRadius: 2.0,
                //           blurRadius: 5.0)
                //     ]),
                child: Text(
                  'Hot deals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              //gridview
              height: 320.0,
              child: items(), //gridview
            ),
          ],
        ),
      ),
    );
  }
}
