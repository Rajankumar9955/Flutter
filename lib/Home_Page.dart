import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding:EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          height: 600,
          width: 600,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hello world"),
                Text(
                  "Cybrom",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Text("Container 1"),
                      
                    ),
                    Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Text("Container 2"),
                    ),
                    Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                  
                      child: Text("Container 3"),
                    ),
                    Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Text("Container 4"),
                    ),
                  ],
            
                ),
                Image.network("https://thumbs.dreamstime.com/z/programming-code-learning-%C3%A2%E2%82%AC%E2%80%9C-learn-to-code-text-colored-letters-abstract-technology-background-programming-code-learning-109305083.jpg")
                             , ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(double.infinity, 45),
                               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                               )                              ),
                              onPressed: () {
                                print("Hello world");
                              }, child: Text("SUBMIT"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}