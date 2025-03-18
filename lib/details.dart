import 'package:flutter/material.dart';
import 'package:diner/products.dart';

class DetailsProductPage extends StatelessWidget {
  final Products product;

  const DetailsProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name,
        style: TextStyle(
          color: Colors.white
        )), backgroundColor: Color(0xFFFFE5C1)),

      body: Center(
        child: Column(
          children: [
            Image.asset(product.image),
            Text(product.name, style: TextStyle(
              fontSize: 21,
              fontFamily: "Poppins",
              color: Colors.black
            )),
            Text(product.description, style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              color: Colors.grey
            ))
          ],
        ),
      ),
    );
  }
}
