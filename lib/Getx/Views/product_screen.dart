

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro1/Getx/Controllers/product_controllers.dart';

class ProdctScreen extends StatelessWidget {
     final productController = Get.put(ProductControllers());
  // const ProdctScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(title: Text("All Product List"),
          centerTitle: true,
                actions: [
                  Row(
                    children: [
                      ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.shopping_cart),
                       label:GetX<ProductControllers>(builder :(controller)=>
                       Text(productController.count.toString()),)  
                        
                      )
                    ],
                  )
                ],
          ),
          body: Column(children: [
            Expanded(
              child: GetBuilder<ProductControllers>(builder: (controller){
                 return     ListView.builder(itemBuilder: (context, index){
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
                          productController.productData[index].productImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productController.productData[index].productName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,),
                            ),
                            IconButton(
                              onPressed: (){
                                productController.addtoFavorite(productController.productData[index].id);
                              }, icon: Icon(productController.productData[index].favorite 
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
                            Text('price ${productController.productData[index].price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,),
                            ),
                            ElevatedButton(onPressed: (){
                              productController.addtoCart(productController.productData[index]);
                            },
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
              }, itemCount: productController.productData.length,);
              },),
             
            ),
            SizedBox(height: 10,),
            GetX<ProductControllers>(builder :(controller)=>
             Text(
              "Total Amount : ${productController.totalPrice}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),),
           
            SizedBox(height: 20,)
          ],),
    );
  }
}

