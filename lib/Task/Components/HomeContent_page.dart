
import 'package:flutter/material.dart';
import 'package:pro1/Task/Models/CollectionsModel.dart';

class HomeContent_page extends StatefulWidget {
  const HomeContent_page({super.key});

  @override
  State<HomeContent_page> createState() => _HomeContent_pageState();
}

class _HomeContent_pageState extends State<HomeContent_page> {
  @override
  Widget build(BuildContext context) {
return

// Scaffold(
//       appBar: AppBar(
//         title: Text('All Featured', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.sort, color: Colors.black),),Text("sort"),
//           IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt, color: Colors.black)),Text("data")
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 80,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundImage: AssetImage(categories.[Image]),
//                       ),
//                       SizedBox(height: 5),
//                       Text(categories[index].Name, style: TextStyle(fontSize: 12)),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 10),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("50–40% OFF", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
//                             SizedBox(height: 8),
//                             Text("Now in (product)", style: TextStyle(color: Colors.white70)),
//                             Text("All colours", style: TextStyle(color: Colors.white70)),
//                             SizedBox(height: 16),
//                             ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 foregroundColor: Colors.pink,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                               child: Text("Shop Now"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 16.0),
//                       child: Image.asset(
//                         "assets/shopping_girl.png",
//                         height: 150,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
   Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(top: 5,left:16,),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(category.Image),
                      child: InkWell(
                        onTap: () {
                          print(category.Name);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(category.Name),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        
      ),
    );
  }

  List<CollectionsModel>categories=[
           CollectionsModel(Image:"assets/beauty.jpg", Name: "Beauty", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",),
           CollectionsModel(Image: "assets/fashion.jpg", Name: "Fashion", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
           CollectionsModel(Image: "assets/kids.jpeg", Name: "Kids", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
           CollectionsModel(Image: "assets/mens.webp", Name: "Mens", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
           CollectionsModel(Image: "assets/women.jpeg", Name: "Womens", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
  ];
}