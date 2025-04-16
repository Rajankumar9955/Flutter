
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pro1/Task/LoginSection/Login_Page.dart';
import 'package:pro1/Task/Task.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

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
                      "Create an\naccount",
                      style: TextStyle(
                        fontSize: 30, color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                    SizedBox(height: 34,),
                    TextFormField(
                     decoration: InputDecoration(
                      hintText: "Username or Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      
                     ),
                     onChanged: (String value){
                            
                     },
                     validator: (value) {
                       return value!.isEmpty ? 'Please Enter Username or Email' : null;
                     },
                     
                    ),
                    SizedBox(height: 28,),
                    TextFormField(
                             decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password), 
                              border: OutlineInputBorder(),                             
                             ),       
                    ),
                     SizedBox(height: 34,),
                    TextFormField(
                     decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      
                     ),
                     onChanged: (String value){
                            
                     },
                     validator: (value) {
                       return value!.isEmpty ? 'Please Enter Username or Email' : null;
                     },
                     
                    ),
                          SizedBox(height: 8,),
                    Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                          // InkWell(
                          //   onTap: () {
                          //       Text("Forget Password", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),);
                          //   },
                          // )
                          
                               Text("By clicking the Register button, you agree to the public offer", style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold,),)

                         ],
                    ),
                     SizedBox(height: 35,),
                    MaterialButton(onPressed: (){},
                    minWidth: double.infinity,
                         child: Text("Create Account",style: TextStyle(fontSize: 15, fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
                         color: Colors.red,
                         height: 50,
                         textColor: Colors.white,
                    ),
                  ],
              ),  
              SizedBox(height: 45,),
             Column(
              children: [
                Text("- OR Continue With -",style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.black),),
              ],
             ),
             SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                          height: 55,
                          width:  55,
                          decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 234, 21, 21)), borderRadius: BorderRadius.circular(50)),
                          child: Image.asset("assets/googleImage.jpeg", height: 50, width: 50, ),
                  ),Container(
                          height: 55,
                          width:  55,
                          decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 234, 20, 20)), borderRadius: BorderRadius.circular(50)),
                          child: Image.asset("assets/applelogo.jpeg", height: 50,width: 50,),
                  ),Container(
                          height: 55,
                          width:  55,
                          decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 240, 21, 21)), borderRadius: BorderRadius.circular(50)),
                          child: Image.asset("assets/facebook.jpeg", height: 50, width: 50,),
                  )
                ],
                
              ),
              SizedBox(height: 35,),
               Column(
               
              children: [ 
                InkWell(
                  child:Text("I Already have an Account : Login",style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.black),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    },
                ),               
              ],
             ),
              
            ],

          ),
        ),
        ) ,
    );
  }
}