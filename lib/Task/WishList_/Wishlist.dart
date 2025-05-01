import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:pro1/Task/Models/Categories.dart';
import 'package:http/http.dart' as http;
import 'package:pro1/Task/WishList_/Controller/Wishlist_Controller.dart';
import 'package:pro1/Task/WishList_/Model/Wishlist_Model.dart';
import 'package:get/get.dart';


import 'package:razorpay_flutter/razorpay_flutter.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {

final WishlistController wishlistController= Get.put(WishlistController());
 var _razorpay = Razorpay();


 @override
  void initState() {
    super.initState();
          _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
          _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
          _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
        }
           void _handlePaymentSuccess(PaymentSuccessResponse response) {
             // Do something when payment succeeds
           }
           
           void _handlePaymentError(PaymentFailureResponse response) {
             // Do something when payment fails
           }
           
           void _handleExternalWallet(ExternalWalletResponse response) {
             // Do something when an external wallet is selected
           }
    @override
        void dispose(){
          _razorpay.clear();
          super.dispose();
        }
  @override
   Widget build(BuildContext context) {
    
     return Scaffold( 
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: SingleChildScrollView(
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
                SizedBox(height: 15),

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
                                          category.imagePath,
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

               Obx(() {
                    return wishlistController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
               child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                        itemCount: wishlistController.ProductItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 0,
                          mainAxisExtent: 350
                          // childAspectRatio: 0.75,
                        ),
                itemBuilder: (context, index) {
                  final product = wishlistController.ProductItems[index];
                  return Container(
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
                            color: const Color.fromRGBO(185, 52, 42, 1,),height: 120,width: double.infinity,)
                           :Image.network(
                            product.images![0].fullUrl! +
                                "/small/" +
                                product.images![0].image!,
                            height: 120,
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
                                 product.productName.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                ],
                              ),
                               Row(
                                    children: [
                                      Text(
                                    '₹ ${product.finalPrice}',
                                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                    ],
                                  ),
                              SizedBox(height: 5),
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
                                  SizedBox(width:3,),
                                      Text("5.0",
                                      style: TextStyle(
                                       fontSize: 16, color: Colors.green,
                                       fontWeight: FontWeight.bold

                                      ),)
                                ],
                              ),
                            
                              SizedBox(height:5,),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(child: ElevatedButton(onPressed: (){
                                             
                                   var options = {
                                    'key': 'rzp_test_xH8lHTk2JMtS8k',
                                    'amount': product.finalPrice!*100, //in paise.
                                    'name': '${product.productName}',
                                    'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                                    'description': '${product.description}',
                                    'timeout': 60, // in seconds
                                    'prefill': {
                                      'contact': '9955236973',
                                      'email': 'krajan92946@gmail.com'
                                    }
                                  };

                                      _razorpay.open(options);


                                       }, child: Text("Buy Now")),)
                                       
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
      }),

              ],
            ),
          ),   
        )
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
      imagePath: "assets/beauty.jpg",
      Name: "Beauty",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      imagePath: "assets/fashion.jpg",
      Name: "Fashion",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      imagePath: "assets/kids.jpeg",
      Name: "Kids",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      imagePath: "assets/mens.webp",
      Name: "Mens",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    CollectionsModel(
      imagePath: "assets/women.jpeg",
      Name: "Womens",
      Description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
  ];
}




