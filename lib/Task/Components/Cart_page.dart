import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Add to Cart Section Page"),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            )
          ),
        ),
        
      ),
    );
  }
}