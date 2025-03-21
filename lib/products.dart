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
      kcal: '219kcal',
    ),
    Products(
      name: "Ice Cream",
      description: "Sorvete sabor morango.",
      price: "RS4,50",
      image: "assets/images/icecream.png",
      kcal: '100kcal',
    ),
    Products(
      name: "Donut",
      description: "Donut sabor morango.",
      price: "RS7,99",
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
        padding: const EdgeInsets.all(10.0), // Padding geral na tela
        child: ListView.builder(
          itemCount: ProductsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsProductPage(product: ProductsList[index])));
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
                padding: EdgeInsets.all(12), // Padding interno do card
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagem do produto
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
                    // Coluna com informações do produto
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
                            ProductsList[index].price,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Calorias à direita
                    Container(
                      child: Stack(
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
