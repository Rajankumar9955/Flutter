import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:pro1/Task/Models/CollectionsModel.dart';
import 'package:http/http.dart' as http;
import 'package:pro1/Task/WishList_/Model/product_model.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  bool isLoading = false;
  Future<List<ProductsModel>> getProduct() async {
    print("All Products");
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.get(
        Uri.parse(
          'https://phplaravel-1264682-5431883.cloudwaysapps.com/api/products',
        ),
      );

      List<ProductsModel> productList = [];
      var data = jsonDecode(response.body.toString());
      data['products'].map((e) {
        productList.add(ProductsModel.fromJson(e));
      }).toList();
      setState(() {
        isLoading = false;
      });
      print(productList);
      return productList;
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
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
                          "${categories.length}+ Items",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
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
                    SizedBox(height: 20),

                    SizedBox(
                      height: 100,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              categories.map((category) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                          category.Image,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            print(category.Name);
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        category.Name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),

                    //Products Card
                    Expanded(
                      child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),

                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                      product.productVideo == null
                                          ? Container(color: const Color.fromRGBO(185, 52, 42, 1))
                                          : Image.network(
                                           product.images![0].fullUrl!+"/small/"+product.images![0].image!,
                                            fit: BoxFit.cover,
                                          ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(product.productName ?? "N/A"),
                                  
                                   
                                ),
                                Container(child:Text("Price ₹"+product.productPrice.toString())),
                                Container(child:Text(product.productColor.toString())),
                                Container(child:Text(product.productDiscount.toString())),
                                Container(child:Text(product.productVideo.toString())),
                                Container(child:Text(product.productWeight.toString())),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
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



  List<CollectionsModel> categories = [
    CollectionsModel(
      Image: "assets/beauty.jpg",
      Name: "Beauty",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      Image: "assets/fashion.jpg",
      Name: "Fashion",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      Image: "assets/kids.jpeg",
      Name: "Kids",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      Image: "assets/mens.webp",
      Name: "Mens",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      Image: "assets/women.jpeg",
      Name: "Womens",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
  ];
}




