
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /* body: Container(
      child: 
      // Obx(() {
      //           if () {
      //             return const Center(child: CircularProgressIndicator());
      //           } else {
                  // return
                  /* GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount:,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 350,
                    ),
                    itemBuilder: (context, index) {
                      final product = ;
                      // final price = product.finalPrice ?? 0.0;

                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: (product.images == null || product.images!.isEmpty)
                                  ? Container(
                                      color: const Color.fromRGBO(185, 52, 42, 1),
                                      height: 120,
                                      width: double.infinity,
                                      child: const Center(
                                        child: Text("Image Not Found!"),
                                      ),
                                    )
                                  : Image.network(
                                      product.images![0].fullUrl! + "/small/" + product.images![0].image!,
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productName.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        '₹${product.productPrice.toString()}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${product.productDiscount} %',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '₹ $price',
                                        style: const TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(5, (starIndex) {
                                          return const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Colors.amber,
                                          );
                                        }),
                                      ),
                                      const SizedBox(width: 3),
                                      const Text(
                                        "5.0",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        
                                      },
                                      child: const Text("Buy Now"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  */
                // }
              // }),
     ),*/
    );
  }
}