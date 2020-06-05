
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GetListitems(
            imageLocation:'assets/1.jpeg',
            imageTitle: 'item_1'
          ),
          GetListitems(
            imageLocation:'assets/1.jpeg',
            imageTitle: 'item_1'
          ),
          GetListitems(
            imageLocation:'assets/1.jpeg',
            imageTitle: 'item_1'
          ),
          GetListitems(
            imageLocation:'assets/1.jpeg',
            imageTitle: 'item_1'
          ),
          GetListitems(
            imageLocation:'assets/1.jpeg',
            imageTitle: 'item_1'
          ),


        ],
      ),
      
    );
  }
}

class GetListitems extends StatelessWidget {
  final String imageLocation;
  final String imageTitle;

  GetListitems({
    this.imageLocation,
    this.imageTitle
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      
      
      padding:EdgeInsets.all(2.0),
      child: InkWell(
        onTap:(){},
        child:Container(
          width: 100.0,
            child: ListTile(
            title:Image.asset(imageLocation,width: 100.0,height: 80.0,),
            subtitle:Container(
              
              padding:EdgeInsets.all(1.0),
              alignment:Alignment.topCenter,
              child: Text(imageTitle),
            ),


          ),
        ),
        
      ),
    );
  }
}