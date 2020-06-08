
import 'package:flutter/material.dart';
import './pages/product_detail.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Container(
      height: 0.15*height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GetListitems(
            imageLocation:'assets/icons/shirt.png',
           
          ),
          GetListitems(
            imageLocation:'assets/icons/tshirt.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/trouser.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/sweet.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/hoodle.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/short.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/sunglass.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/tie.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/belt.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/cap.png',
            
          ),
          GetListitems(
            imageLocation:'assets/icons/watch.png',
            
          ),
          


        ],
      ),
      
    );
  }
}

class GetListitems extends StatelessWidget {
  final String imageLocation;
  

  GetListitems({
    this.imageLocation,
    
  });
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return InkWell(
      
        onTap: () {},
        child:Container(
          
          
          margin: EdgeInsets.all(0),
          width: 120.0,
            child: ListTile(
              
            title:Container(
              height: 200,
              
              
              child: Image.asset(imageLocation,)),
            


          ),
        ),
        
      );
    
  }
}