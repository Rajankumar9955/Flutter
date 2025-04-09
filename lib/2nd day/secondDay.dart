// import 'package:flutter/material.dart';
// import 'package:pro1/2nd%20day/model/product_model.dart';

// class ProductPage extends StatelessWidget {
//    ProductPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//       appBar: AppBar(title: Text("Product Page")),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16,),
//         child: Column(children: [Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),

//             color: const Color.fromARGB(255, 80, 240, 104),
//             boxShadow:[BoxShadow(
//                color: const Color.fromARGB(255, 241, 157, 151),
//                blurRadius: 2,
//                offset: Offset(0, 1,),

//             )]

//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset("assets/realme8.jpg",height: 100,width: 100,),
//               SizedBox(width: 10,),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Name : Mobile"),
//                   Text("Price : 350"),

//                 ],

//               )

//             ],
//           ),
//         )]),

//       )

//     );
//   }
// }

// ==============================

import 'package:flutter/material.dart';
import 'package:pro1/2nd%20day/model/product_model.dart';
import 'package:pro1/theme/app_text.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Page")),
      body: ListView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CardWidget(
            image: products[index].image,
            name: products[index].name,
            price: products[index].price,
          );
        },
      ),
    );
  }

  List<ProductModel> products = [
    ProductModel(image: "assets/realme8.jpg", name: "mobile", price: 20.00),
    ProductModel(image: "assets/realme8.jpg", name: "mobile", price: 20.00),
    ProductModel(image: "assets/realme8.jpg", name: "mobile", price: 20.00),
    ProductModel(image: "assets/realme8.jpg", name: "mobile", price: 20.00),
  ];
}

class CardWidget extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  const CardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 204, 224, 226),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 167, 173, 173),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, height: 140, width: 180),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name : $name",
                style: AppText.kText18w600,
              ),
              Text("Price : $price",
               style: AppText.kText18w600,),
            ],
          ),
        ],
      ),
    );
  }
}
