import 'package:flutter/material.dart';







class ProductDetails extends StatefulWidget {

  final ProductDetails_Name;
  final ProductDetails_Image;
  final ProductDetails_Old;
  final ProductDetails_Price;
  
  ProductDetails({
    this.ProductDetails_Name,
    this.ProductDetails_Image,
    this.ProductDetails_Old,
    this.ProductDetails_Price
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title:Text('ABC fashion',textAlign: TextAlign.center,),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){})
        ],

      ),
      body: ListView(
        children: <Widget>[
          Container(
            height:300,
            child: GridTile(
              child: Container(
                color:Colors.white,
                child:Image.asset(widget.ProductDetails_Image)
              ),
              footer: Container(
                
                height:60.0,
                color:Colors.white70,
                child: ListTile(
                  leading:Text(widget.ProductDetails_Name,style: TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
                  title: Container(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: <Widget> [
                        Expanded(
                          child: Text(widget.ProductDetails_Price)),
                        Expanded(
                          child: Text(widget.ProductDetails_Old,style: TextStyle(decoration:TextDecoration.lineThrough),)
                          )
                          
                      ]
                    ),
                  ),
                  ),
              ),
              ),
          ),

          Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(onPressed: (){},
              color: Colors.white,
              textColor: Colors.black,
              child:Row(
                children: <Widget>[
                  Expanded(child: Text('Size')
                  ),
                  Expanded(child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),),
            ),






            Expanded(
              child: MaterialButton(onPressed: (){},
              color: Colors.white,
              textColor: Colors.black,
              child:Row(
                children: <Widget>[
                  Expanded(child: Text('Color')
                  ),
                  Expanded(child: Icon(Icons.arrow_drop_down),
                  ),  
                ],
              ),),
            ),




            Expanded(
              child: MaterialButton(onPressed: (){},
              color: Colors.white,
              textColor: Colors.black,
              child:Row(
                children: <Widget>[
                  Expanded(child: Text('Qty')
                  ),
                  Expanded(child: Icon(Icons.arrow_drop_down),
                  ),  
                ],
              ),),
            ),



            
          ],
          ),



          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(
                onPressed: (){},
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Buy now'),
              ),),

              IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){}),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}),
            ],
          ),

          Divider(),

          ListTile(
            title: Text('Discription'),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style: TextStyle(fontSize:18),),

          ),

          Divider(),       

          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text('Product name :',style: TextStyle(color:Colors.grey),),
              ),

              Padding(padding: const EdgeInsets.all(5.0),
              child: Text(widget.ProductDetails_Name,style: TextStyle(color:Colors.grey),),
              
              )
              
            ],
            
          ),

          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text('Brand :',style: TextStyle(color:Colors.grey),),
              ),

              Padding(padding: const EdgeInsets.all(5.0),
              child: Text('unbranded',style: TextStyle(color:Colors.grey))
              
              )
            ],
          ),
        ],
      ),
    );
  }
}