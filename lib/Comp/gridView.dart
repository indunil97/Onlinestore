import 'package:flutter/material.dart';
import './pages/product_detail.dart';

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
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: Text("hero1"), //can coused a error
            child: Material(
              child: InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){return ProductDetails(
                  ProductDetails_Name: productName,
                  ProductDetails_Image: productImage,
                  ProductDetails_Old: productOld,
                  ProductDetails_Price: productPrice,
                );}));},
                child: GridTile(
                  footer: Container(
                      color: Colors.white70,
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
                  child: Image.asset(productImage, fit: BoxFit.cover),
                ),
              ),
            )));
  }
}
