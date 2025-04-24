

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro1/Getx/Controllers/product_controllers.dart';

class ProdctScreen extends StatelessWidget {
     final productController = Get.put(ProductControllers());
  // const ProdctScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text("All Product List"),
          centerTitle: true,
                actions: [
                  Row(
                    children: [
                      ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.shopping_cart),
                       label: Text('0'),
                      )
                    ],
                  )
                ],
          ),
          body: Column(children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index){
                  return Container(child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color:Theme.of(context).primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: Column(
                      children: [SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
                        child: Image.asset(
                          productController.products[index].productImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productController.products[index].productName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,),
                            ),
                            IconButton(
                              onPressed: (){
                            }, icon: Icon(productController.Products[index].favorite 
                                       ? Icons.favorite:
                                       Icons.favorite_border, 

                                       color: Colors.red,
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('price ${productController.produts[index].price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,),
                            ),
                            ElevatedButton(onPressed: (){},
                             child: Text("Add to Cart",
                             style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,),),
                            )
                          ],
                        ),
                      )
                      ],
                    ),
                  ),);
              }, itemCount: productController.productData.length,)
            ),
          ],),
    );
  }
}

