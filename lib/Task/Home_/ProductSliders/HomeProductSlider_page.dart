import 'package:flutter/material.dart';
import 'package:pro1/Task/Home_/ProductSliders/Controller/getX_Controller.dart';
import 'package:get/get.dart';

class ProductSlider extends StatefulWidget {
  ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final ProductController productController = Get.put(ProductController());
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return productController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SizedBox(
            height: 420,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productController.ProductItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = productController.ProductItems[index];
                return Container(
                  width: 250,
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
                          child: Center( child: Text("Image Not Found!"),),
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
                              ),
                            ),

                            SizedBox(height: 5),
                            Text(
                              product.description.toString(),
                              style: TextStyle(color: Colors.grey),
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
                                  style: TextStyle(color: Colors.orange),
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
                                  style: TextStyle(color: Colors.grey),
                                ), 
                              ],
                              
                            ),
                            SizedBox(height:5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          );
    });
  }
}
