// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:pro1/Task/Models/Categories.dart';
// import 'package:http/http.dart' as http;
// import 'package:pro1/Task/WishList_/Controller/Wishlist_Controller.dart';
// import 'package:pro1/Task/WishList_/Model/Wishlist_Model.dart';
// import 'package:get/get.dart';


// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class WishList extends StatefulWidget {
//   const WishList({super.key});

//   @override
//   State<WishList> createState() => _WishListState();
// }

// class _WishListState extends State<WishList> {

// final WishlistController wishlistController= Get.put(WishlistController());
// //  var _razorpay = Razorpay();
//  late Razorpay _razorpay;


//  @override
//   void initState() {
//     super.initState();
//            _razorpay = Razorpay();
//           _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//           _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//           _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//         }
//            void _handlePaymentSuccess(PaymentSuccessResponse response) {
//              // Do something when payment succeed
//              print("success $response");
//            }
           
//            void _handlePaymentError(PaymentFailureResponse response) {
//              // Do something when payment fails
//              print("failed $response");
//            }
           
//            void _handleExternalWallet(ExternalWalletResponse response) {
//              // Do something when an external wallet is selected
//               print("wallet $response");
//            }
//     @override
//         void dispose(){
//           _razorpay.clear();
//           super.dispose();
//         }
//   @override
//    Widget build(BuildContext context) {
    
//      return Scaffold( 
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Search
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.search, color: Colors.grey),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Search any Product..",
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       Icon(Icons.mic, color: Colors.grey),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
            
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "All Featured",
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
            
//                     Row(
//                       children: [
//                         _actionButton("Sort", Icons.swap_vert),
//                         SizedBox(width: 10),
//                         _actionButton("Filter", Icons.filter_alt),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 15),

//                SizedBox(
//                       height: 100,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children:
//                               categories.map((category) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(right: 16),
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 30,
//                                         backgroundImage: AssetImage(
//                                           category.imagePath,
//                                         ),
//                                         child: InkWell(
//                                           onTap: () {
//                                             print(category.Name);
//                                           },
//                                         ),
//                                       ),
//                                       SizedBox(height: 6),
//                                       Text(
//                                         category.Name,
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }).toList(),
//                         ),
//                       ),
//                     ),

//                Obx(() {
//                     return wishlistController.isLoading.value
//                     ? Center(child: CircularProgressIndicator())
//                     : SizedBox(
//                child: GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                   padding: const EdgeInsets.all(8),
//                         itemCount: wishlistController.ProductItems.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 2,
//                           crossAxisSpacing: 0,
//                           mainAxisExtent: 350
//                           // childAspectRatio: 0.75,
//                         ),
//                 itemBuilder: (context, index) {
//                   final product = wishlistController.ProductItems[index];
//                   return Container(
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(10),
//                           ),
//                           child:
//                           product.images!.isEmpty ||product.images==null ? 
//                           Container(
//                             child: Center( child: Text("Image Not Found!"),),
//                             color: const Color.fromRGBO(185, 52, 42, 1,),height: 120,width: double.infinity,)
//                            :Image.network(
//                             product.images![0].fullUrl! +
//                                 "/small/" +
//                                 product.images![0].image!,
//                             height: 120,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(8),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                  product.productName.toString(),
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),

//                               SizedBox(height: 10),
//                               Row(
//                                 children: [
//                                   Text(
//                                    '₹${product.productPrice.toString()}',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(width: 10),
//                                   Text(
//                                     '${product.productDiscount} %',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       decoration: TextDecoration.lineThrough,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   SizedBox(width: 10),
//                                 ],
//                               ),
//                                Row(
//                                     children: [
//                                       Text(
//                                     '₹ ${product.finalPrice}',
//                                     style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
//                                   ),
//                                     ],
//                                   ),
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Row(
//                                     children: List.generate(5, (starIndex) {
//                                       return Icon(
//                                         Icons.star,
//                                         size: 18,
//                                         // color: starIndex < kurta['rating']
//                                         //     ? Colors.amber
//                                         //     : Colors.grey,
//                                       );
//                                     }),
//                                   ),
//                                   SizedBox(width:3,),
//                                       Text("5.0",
//                                       style: TextStyle(
//                                        fontSize: 16, color: Colors.green,
//                                        fontWeight: FontWeight.bold

//                                       ),)
//                                 ],
//                               ),
                            
//                               SizedBox(height:5,),
//                               Column(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Center(child: ElevatedButton(onPressed: (){
                                             
//                                    var options = {
//                                     'key': 'rzp_test_xH8lHTk2JMtS8k',
//                                     'amount': product.finalPrice!*100, //in paise.
//                                     'name': '${product.productName}',
//                                     'order_id': DateTime.now().toString(), // Generate order_id using Orders API
//                                     'description': '${product.description}',
//                                     'timeout': 60, // in seconds
//                                     'prefill': {
//                                       'contact': '9955236973',
//                                       'email': 'krajan92946@gmail.com'
//                                     }
//                                   };

                                      
//                                       try{
//                                         _razorpay.open(options);
//                                       }catch(e){
//                                         print("eeeeeeeeeeeeeeeeeeeee ${e.toString()}");
//                                       }


//                                        }, child: Text("Buy Now")),)
                                       
//                                     ],
//                                   )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
                  
//                   );
//                 },
//               ),
//             );
//       }),

//               ],
//             ),
//           ),   
//         )
//       ),
//     );
//    }

//   Widget _actionButton(String label, IconData icon) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
//           SizedBox(width: 4),
//           Icon(icon, size: 18),
//         ],
//       ),
//     );
//   }



//   List<CollectionsModel> categories = [
//     CollectionsModel(
//       imagePath: "assets/beauty.jpg",
//       Name: "Beauty",
//       Description:
//           "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
//     ),
//     CollectionsModel(
//       imagePath: "assets/fashion.jpg",
//       Name: "Fashion",
//       Description:
//           "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
//     ),
//     CollectionsModel(
//       imagePath: "assets/kids.jpeg",
//       Name: "Kids",
//       Description:
//           "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
//     ),
//     CollectionsModel(
//       imagePath: "assets/mens.webp",
//       Name: "Mens",
//       Description:
//           "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
//     ),
//     CollectionsModel(
//       imagePath: "assets/women.jpeg",
//       Name: "Womens",
//       Description:
//           "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
//     ),
//   ];
// }




import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pro1/Task/Models/Categories.dart';
import 'package:pro1/Task/WishList_/Controller/Wishlist_Controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistController wishlistController = Get.put(WishlistController());

  late Razorpay _razorpay;

  // Replace with your Razorpay Test Key and Secret.
  final String razorPayKey = "rzp_test_xH8lHTk2JMtS8k";
  final String razorPaySecret = "Q3XceCmcCk3ewdZf5G1mVtPM"; // Should be stored securely and used on backend

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment Success: ${response.paymentId}"),
      backgroundColor: Colors.green,
    ));
    print(response.data);
    // Additional logic after success e.g. update UI, confirm order
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment Failed: ${response.message}"),
      backgroundColor: Colors.red,
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("External Wallet Selected: ${response.walletName}"),
      backgroundColor: Colors.orange,
    ));
  }

  Future<String> _createOrder(double amount) async {
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$razorPayKey:$razorPaySecret'));

    final Map<String, dynamic> body = {
      "amount": (amount * 100).toInt(), // Amount in paise
      "currency": "INR",
      "receipt": "receipt_${DateTime.now().millisecondsSinceEpoch}",
      "payment_capture": 1
    };

    final Uri url = Uri.parse('https://api.razorpay.com/v1/orders');

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
        body: json.encode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['id']; // order_id from Razorpay
    } else {
      throw Exception('Failed to create order: ${response.body}');
    }
  }

  void _openCheckout(double amount, String productName, String description) async {
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid product amount."),
        backgroundColor: Colors.red,
      ));
      return;
    }

    try {
      final String orderId = await _createOrder(amount);
      var options = {
        'key': razorPayKey,
        'amount': (amount * 100).toInt(), // in paise
        'name': productName,
        'order_id': orderId,
        'description': description,
        'timeout': 60,
        'prefill': {
          'contact': '9955236973', // Optionally, get from user profile
          'email': 'krajan92946@gmail.com' // Optionally, get from user profile
        },
      };

      _razorpay.open(options);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: ${e.toString()}"),
        backgroundColor: Colors.red,
      ));
    }
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Search any Product..",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.mic, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Header with Sort & Filter buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Featured",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _actionButton("Sort", Icons.swap_vert),
                      const SizedBox(width: 10),
                      _actionButton("Filter", Icons.filter_alt),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Categories horizontal scroller
              SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
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
                            const SizedBox(height: 6),
                            Text(
                              category.Name,
                              style: const TextStyle(
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
                if (wishlistController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: wishlistController.ProductItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 350,
                    ),
                    itemBuilder: (context, index) {
                      final product = wishlistController.ProductItems[index];
                      final price = product.finalPrice ?? 0.0;

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
                                        if (price <= 0) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("Invalid product price"),
                                            backgroundColor: Colors.red,
                                          ));
                                          return;
                                        }
                                        _openCheckout(product.finalPrice!.toDouble(), product.productName ?? "Product", product.description ?? "");
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
                  );
                }
              }),
            ],
          ),
        ),
      )),
    );
  }

  Widget _actionButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
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
