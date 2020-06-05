
import 'package:flutter/material.dart';

class items extends StatefulWidget {
  @override
  _itemsState createState() => _itemsState();
}

class _itemsState extends State<items> {
  var products = [
    {
      "name": "Item1",
      "image": "assets/1.jpeg",
      "old_Price": "50",
      "price": "40"
    },
    {
      "name": "Item2",
      "image": "assets/1.jpeg",
      "old_Price": "50",
      "price": "40"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "50",
      "price": "40"
    },
    {
      "name": "Item3",
      "image": "assets/1.jpeg",
      "old_Price": "50",
      "price": "40"
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
            tag: productName,
            child: Material(
              child: InkWell(
                onTap: () {},
                child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        leading: Container(
                            padding: EdgeInsets.fromLTRB(1, 10, 80, 10),
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