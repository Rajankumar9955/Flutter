
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 16,width: 18,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome\nBack!",
                      style: TextStyle(
                        fontSize: 30, color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                    TextFormField(
                     decoration: InputDecoration(
                      hintText: "Email"
                     ),
                    )

                  ],
              ),
            ],
          ),
        ),
        ) ,
    );
  }
}