import 'package:flutter/material.dart';
import 'package:diner/products.dart';

class DetailsProductPage extends StatefulWidget {
  final Products product;
  final Ingredientes ingredientes;

  const DetailsProductPage({super.key, required this.product, required this.ingredientes});

  @override
  _DetailsProductPageState createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {

  void incrementar() {
    setState(() {
      widget.product.quantity++;
    });
  }

  void decrementar() {
    setState(() {
      if (widget.product.quantity > 1) {
        widget.product.quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFFFE5C1),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFFE5C1), Color(0xFFF2A7A1)],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(widget.product.image),
                  SizedBox(height: 20),
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (widget.ingredientes.pao != '') Image.asset(widget.ingredientes.pao, width: 70, height: 70),
                        if (widget.ingredientes.tomate != '') Image.asset(widget.ingredientes.tomate, width: 70, height: 70),
                        if (widget.ingredientes.queijo != '') Image.asset(widget.ingredientes.queijo, width: 70, height: 70),
                        if (widget.ingredientes.hamburguer != '') Image.asset(widget.ingredientes.hamburguer, width: 70, height: 70),
                        if (widget.ingredientes.alface != '') Image.asset(widget.ingredientes.alface, width: 70, height: 70),
                        if (widget.ingredientes.casquinha != '') Image.asset(widget.ingredientes.casquinha, width: 70, height: 70),
                        if (widget.ingredientes.morango != '') Image.asset(widget.ingredientes.morango, width: 70, height: 70),
                        if (widget.ingredientes.donut != '') Image.asset(widget.ingredientes.donut, width: 70, height: 70),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 200,
                        color: Color(0xFFFFE5C1),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFFFFE5C1),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          widget.product.kcal,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            color: Color(0xFFFFE5C1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'R\$${(widget.product.price * widget.product.quantity).toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: incrementar,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFFFFE5C1)),
                        ),
                        child: Text("+",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white)),
                      ),
                      Text(
                        '${widget.product.quantity}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25, fontWeight: FontWeight.w100
                        ),
                      ),
                      ElevatedButton(
                        onPressed: decrementar,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFFFFE5C1)),
                        ),
                        child: Text("-", style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
