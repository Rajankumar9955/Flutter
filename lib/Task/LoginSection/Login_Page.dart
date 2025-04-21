
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pro1/Task/LoginSection/ForgetPass_Page.dart';
import 'package:pro1/Task/LoginSection/CreateUser_page.dart';
import 'package:pro1/Task/GetStarted/GetStarted_page.dart';
import 'package:pro1/Task/Task.dart';

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
                          SizedBox(height: 8,),
                    Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           InkWell(
                  child:Text("Forget Password", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold,),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetpassPage(),));
                    },
                ),   

                         ],
                    ),
                     SizedBox(height: 35,),
                    MaterialButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => GetstartedPage(),));
                    },
                    minWidth: double.infinity, 
                         child: 
                         Text("Login",style: TextStyle(fontSize: 15, fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
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
                          child: Image.asset("assets/googleImage.jpeg", height: 50, width: 50, fit: BoxFit.cover),
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
                  child:Text("Create An Account: Signup",style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.black),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUserPage(),));
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