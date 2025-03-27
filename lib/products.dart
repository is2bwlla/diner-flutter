import 'package:diner/details.dart';
import 'package:flutter/material.dart';

class Products {
  final String name;
  final String description;
  double price;
  final String image;
  final String kcal;
  int quantity;

  Products({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.kcal,
    this.quantity = 1,
  });
}

class Ingredientes {
  final String pao;
  final String tomate;
  final String queijo;
  final String hamburguer;
  final String alface;

  final String casquinha;
  final String morango;

  final String donut;

  Ingredientes({
    required this.pao,
    required this.tomate,
    required this.queijo,
    required this.hamburguer,
    required this.alface,

    required this.casquinha,
    required this.morango,

    required this.donut,
  });
}

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final Ingredientes ingredientesHamburguer = Ingredientes(
    pao: "assets/images/pao.png",
    tomate: "assets/images/tomate.png",
    queijo: "assets/images/queijo.png",
    hamburguer: "assets/images/carne.png",
    alface: "assets/images/alface.png",
    casquinha: "",
    morango: "",
    donut: "",
  );

  final Ingredientes ingredientesSorvete = Ingredientes(
    pao: "",
    tomate: "",
    queijo: "",
    hamburguer: "",
    alface: "",
    casquinha: "assets/images/casquinha.png",
    morango: "assets/images/morango.png",
    donut: "",
  );

  final Ingredientes ingredientesDonut = Ingredientes(
    pao: "",
    tomate: "",
    queijo: "",
    hamburguer: "",
    alface: "",
    casquinha: "",
    morango: "assets/images/morango.png",
    donut: "assets/images/rosquinha.png",
  );

  final List<Products> ProductsList = [
    Products(
      name: "Burguer",
      description: "BigMac delicioso.",
      price: 19.99,
      image: 'assets/images/burguer.png',
      kcal: '219kcal',
    ),
    Products(
      name: "Ice Cream",
      description: "Sorvete sabor morango.",
      price: 4.50,
      image: "assets/images/icecream.png",
      kcal: '100kcal',
    ),
    Products(
      name: "Donut",
      description: "Donut sabor morango.",
      price: 7.99,
      image: "assets/images/donut.png",
      kcal: "110kcal",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFFFE5C1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: ProductsList.length,
          itemBuilder: (context, index) {
            Ingredientes ingredientes;
            if (index == 0) {
              ingredientes = ingredientesHamburguer;
            } else if (index == 1) {
              ingredientes = ingredientesSorvete;
            } else {
              ingredientes = ingredientesDonut;
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsProductPage(
                      product: ProductsList[index],
                      ingredientes: ingredientes,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10), //
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFE5C1), Color(0xFFFFF3E0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    )
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        ProductsList[index].image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ProductsList[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ProductsList[index].description,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'R\$${ProductsList[index].price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 2,
                          color: Color(0xFFFFCDA3),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFFFFCDA3),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            ProductsList[index].kcal,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFA726),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
