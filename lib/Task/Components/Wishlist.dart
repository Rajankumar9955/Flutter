import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("WishList"),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            )
          ),
        ),
        
      ),
    );;
  }
}