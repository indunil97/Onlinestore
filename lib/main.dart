
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import './Comp/gridView.dart';
import 'Comp/horizontal_cat.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),

  ));

}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
  Widget imageCar = Container(
    height:250,
    child: Carousel(
      boxFit:BoxFit.cover,
      images:[
        AssetImage('assets/1.jpeg'),
        AssetImage('assets/1.jpeg'),
        AssetImage('assets/1.jpeg'),
      
      ],
      autoplay: true,
      animationCurve: Curves.easeIn,
      animationDuration: Duration(milliseconds: 1000),
    )
  );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title:Text('ABC fashion',textAlign: TextAlign.center,),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){})
        ],

      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color:Colors.black87
              ),
              accountName: Text('abc95'), 
              accountEmail: Text('abc95@ymail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,size: 50.0,))
              ),
              
              ),
            
            InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Home'),
                leading:Icon(Icons.home),
              ),
            ),


               InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Orders'),
                leading:Icon(Icons.shopping_basket),
              ),
            ),

               InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Cart'),
                leading:Icon(Icons.shopping_cart),
              ),
            ),

               InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Categories'),
                leading:Icon(Icons.dashboard),
              ),
            ),


            InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Favourites'),
                leading:Icon(Icons.favorite),
              ),
            ),

            Divider(),

               InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Settings'),
                leading:Icon(Icons.settings),
              ),
            ),

               InkWell(
                child: ListTile(
                onTap: (){},
                title:Text('Help'),
                leading:Icon(Icons.help),
              ),
            ),
          ],
        )
      ),
      body: ListView(
        children: <Widget>[
          imageCar,                                              //imagecarousel
          
          Padding(padding: EdgeInsets.all(10.0,),
          child: Text('Categories',
          style: TextStyle(fontSize:20),),
          ),
          HorizontalList(),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,10.0),
            child: Text('Hot deals',
            style: TextStyle(fontSize: 20),),
          ),

          Container(
            height: 320.0,
            child: items(),//gridview
          ),

        ],
        
      ),
      


    );
  }
}