import 'package:flutter/material.dart';
import 'package:pro1/3rd%20day/model/productModel.dart';


class ProductDetailPage extends StatelessWidget {
  final Productmodel1 product;
  const  ProductDetailPage({
    super.key,
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details Pages"),),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: SingleChildScrollView(
              
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                 
                children: [
                  Container(
                    
                    
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255,204,224,154),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 224,167,1730),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                                
                              )
                            ]
                          ),
                          child: Column(children: [
                            Image.asset(product.Image),  Text(product.name,
                        style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                Text( "₹ ${product.price.toString()}",
                        style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 16, 241, 68)),
                ),
                
                  Text(product.decription
                   , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                  )
 
                          ],),
                        
                  ),
                  
                               ],
              ),
            ),
          ),
        ),
    );
  }
}