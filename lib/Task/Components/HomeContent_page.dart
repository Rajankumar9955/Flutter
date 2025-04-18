
import 'package:flutter/material.dart';

class HomeContent_page extends StatefulWidget {
  const HomeContent_page({super.key});

  @override
  State<HomeContent_page> createState() => _HomeContent_pageState();
}

class _HomeContent_pageState extends State<HomeContent_page> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Center(
        child: Container(
          child: Text("Home Page"),
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