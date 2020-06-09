import 'package:flutter/material.dart';
import '../product_detail.dart';

class items extends StatefulWidget {
  @override
  _itemsState createState() => _itemsState();
}

class _itemsState extends State<items> {
  var products = [
    {
      "name": "Red hat",
      "image": "assets/1.jpeg",
      "old_Price": "\$50.99",
      "price": "\$40.99"
    },
    {
      "name": "Shirt ",
      "image": "assets/1.jpeg",
      "old_Price": "\$50.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$50.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "\$40.99",
      "price": "\$40.99"
    },
  ];

  //building list view
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
        
            SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1,crossAxisCount: 2,),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
              productName: products[index]['name'],
              productImage: products[index]['image'],
              productOld: products[index]['old_Price'],
              productPrice: products[index]['price']);
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productImage;
  final productOld;
  final productPrice;

  SingleProduct(
      {this.productName,
      this.productImage,
      this.productOld,
      this.productPrice});

      //one card
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(15.0),
        boxShadow:[
          BoxShadow(color: Colors.grey.withOpacity(0.2),
          spreadRadius:4.0,
          blurRadius:96.0)
        ]
      ),
        child: Hero(
            tag: Text("hero1"), //can coused a error
            child: Material(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(16),
                
              ),
            
              child: InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){return ProductDetails(
                  ProductDetails_Name: productName,
                  ProductDetails_Image: productImage,
                  ProductDetails_Old: productOld,
                  ProductDetails_Price: productPrice,
                );}));},
                child: Container(
                  
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(11.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                  child: GridTile(
                    footer: Container(
                      
                      
                      
                        color: Colors.transparent,
                        child: ListTile(
                          leading: Container(
                              
                              child: Text(
                                productName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                          title: Text(
                            '\$$productPrice',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '\$$productOld',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        )),
                    child: Icon(Icons.add_shopping_cart),
                  ),
                ),
              ),
            )));
  }
}
