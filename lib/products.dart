import 'package:diner/details.dart';
import 'package:flutter/material.dart';

class Products {
  final String name;
  final String description;
  final String price;
  final String image;
  final String kcal;

  Products({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.kcal,
  });
}


class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final List<Products> ProductsList = [
    Products(
        name: "Burguer",
        description: "BigMac delicioso.",
        price: "RS19,99",
        image: 'assets/images/burguer.png',
        kcal: '219kcal'),

    Products(
        name: "Ice Cream",
        description: "Sorvete sabor morango.",
        price: "RS4,50",
        image: "assets/images/icecream.png"),

    Products(
        name: "Donut",
        description: "Donut sabor morango.",
        price: "RS7,99",
        image: "assets/images/donut.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold
          )), backgroundColor: Color(0xFFFFE5C1)),

      body: ListView.builder(
        itemCount: ProductsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> DetailsProductPage(product: ProductsList[index])));
            },
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 160,
                child: Row(
                  children: [
                    Image.asset(ProductsList[index].image,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ProductsList[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),),
                        Text(ProductsList[index].description,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                            )),
                        Text(ProductsList[index].price,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18
                            ))
                      ],
                    )
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}
