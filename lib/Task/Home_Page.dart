
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea 
      (child: Padding
      (padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
  children: [
      Image.asset("assets/GetStarted.jpg")
  ],
),
      )),
    );
  }
}