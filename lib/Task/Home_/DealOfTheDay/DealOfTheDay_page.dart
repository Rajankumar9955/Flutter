import 'package:flutter/material.dart';
import 'package:pro1/Task/Home_/DealOfTheDay/Controller/DealController.dart';
import 'package:get/get.dart';

class DealOfTheDayProducts extends StatefulWidget {
  const DealOfTheDayProducts({super.key});

  @override
  State<DealOfTheDayProducts> createState() => _DealOfTheDayProductsState();
}

class _DealOfTheDayProductsState extends State<DealOfTheDayProducts> {
  final Dealcontroller dealcontroller = Get.put(Dealcontroller());
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return dealcontroller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
              shrinkWrap: true,
              itemCount: dealcontroller.ProductItems.length,
              scrollDirection: Axis.vertical,
              
              itemBuilder: (context, index) {
                final product = dealcontroller.ProductItems[index];
                return Container(
                  width: 200,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child:
                        product.images!.isEmpty ||product.images==null ? 
                        Container(
                          child: Center( child: Text("Image Not Found!", style: TextStyle(fontSize: 16),),),
                          color: const Color.fromRGBO(185, 52, 42, 1,),height: 200,width: double.infinity,)
                         :Image.network(
                          product.images![0].fullUrl! +
                              "/small/" +
                              product.images![0].image!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // 'Wowen Printed Kurti',
                               product.productName.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber
                              ),
                            ),
                  
                            SizedBox(height: 5),
                            Text(
                              product.description.toString(),
                              style: TextStyle(color: Colors.grey, fontSize: 28),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                 '₹${product.productPrice.toString()}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${product.productDiscount} %',
                                  style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '₹ ${product.finalPrice}',
                                  style: TextStyle(color: Colors.orange, fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(5, (starIndex) {
                                    return Icon(
                                      Icons.star,
                                      size: 18,
                                      // color: starIndex < kurta['rating']
                                      //     ? Colors.amber
                                      //     : Colors.grey,
                                    );
                                  }),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "5 Star",
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ), 
                              ],
                              
                            ),
                            SizedBox(height:5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                     ElevatedButton(onPressed: (){
                                            print("You Clicked the Buy Now Button");
                                     }, child: Text("Buy Now")),
                                      ElevatedButton(onPressed: (){
                                             print("You Clicked the Add to Cart Button");
                                     }, child: Text("Add to Cart")),
                                  ],
                                )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
      }),
    );
  }
}