
import 'package:flutter/material.dart';
import 'package:pro1/Task/Models/Categories.dart';

class CategoryProducts extends StatelessWidget {
   CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category Page"),),
     body: Container(
      child: 
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search any Product..",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.grey),
                    ],
                  ),
                ),
                SizedBox(height: 20),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Featured",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
            
                    Row(
                      children: [
                        _actionButton("Sort", Icons.swap_vert),
                        SizedBox(width: 10),
                        _actionButton("Filter", Icons.filter_alt),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 9),  
                
// Obx(() {
      //           if () {
      //             return const Center(child: CircularProgressIndicator());
      //           } else {
                  // return
                  
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount:categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 350,
                    ),
                    itemBuilder: (context, index) {
                      // final product = ;
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
                          // spacing:2,
                          children: [
                            // ClipRRect(
                            //   borderRadius: const BorderRadius.vertical(
                            //     top: Radius.circular(10),
                            //   ),
                            //   child:
                              //  (Products.imagePath == null || product.images!.isEmpty)
                              //     ? Container(
                              //         color: const Color.fromRGBO(185, 52, 42, 1),
                              //         height: 120,
                              //         width: double.infinity,
                              //         child: const Center(
                              //           child: Text("Image Not Found!"),
                              //         ),
                              //       )
                              //     : Image.network(
                              //         product.images![0].fullUrl! + "/small/" + product.images![0].image!,
                              //         height: 120,
                              //         width: double.infinity,
                              //         fit: BoxFit.cover,
                              //       ),

                            // ),

                            Container(
                              child: Image.asset(categories[index].imagePath,height: 120,width:150),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   categories[index].Name,   ///////
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        // '₹${product.productPrice.toString()}',
                                        categories[index].Description.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),

                                
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                            Row(children: [
                                      Text(
                                        // '${product.productDiscount} %',
                                         categories[index].productPrice.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                              Text(
                                        // '${product.productDiscount} %',
                                       '${categories[index].productDiscount.toString()}%',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                 ],),
                                  Row(
                                    children: [
                                      Text(
                                        // '₹ $price',
                                        categories[index].FinalPrice.toString(),
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
                // }
              // }),   
              ],
            ),
          ),
        )
      ),
     ),
    );
  }



 List<CollectionsModel> categories = [
    CollectionsModel(
      imagePath: "assets/beauty.jpg",
      Name: "Beauty",
      Description:
      'For Women',
       productPrice:1220,
       productDiscount:10,
       FinalPrice:1130,
    ),
    CollectionsModel(
      imagePath: "assets/fashion.jpg",
      Name: "Fashion",
      Description:
               'for Women',
       productPrice:1220,
       productDiscount:10,
       FinalPrice:1130,
    ),
    CollectionsModel(
      imagePath: "assets/kids.jpeg",
      Name: "Kids",
      Description:
          'for Kids',
       productPrice:1220,
       productDiscount:10,
       FinalPrice:1130,
    ),
    CollectionsModel(
      imagePath: "assets/mens.webp",
      Name: "Mens",
      Description:
         ' for Mens',
       productPrice:1220,
       productDiscount:10,
       FinalPrice:1130,
    ),
    CollectionsModel(
      imagePath: "assets/women.jpeg",
      Name: "Womens",
      Description:
          ' for Women',
       productPrice:1220,
       productDiscount:10,
       FinalPrice:1130,
    ),
     
  ];
}



Widget _actionButton(String label, IconData icon) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(width: 4),
        Icon(icon, size: 18),
      ],
    ),
  );
}