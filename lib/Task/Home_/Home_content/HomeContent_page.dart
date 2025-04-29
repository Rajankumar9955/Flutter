import 'package:flutter/material.dart';
import 'package:pro1/2nd%20day/model/product_model.dart';
import 'package:pro1/Task/Home_/ProductSliders/HomeProductSlider_page.dart';
import 'package:pro1/Task/Models/CollectionsModel.dart';
import 'package:pro1/Task/Models/PromoBanner_Model.dart';

class HomeContent_page extends StatefulWidget {
  const HomeContent_page({super.key});

  @override
  State<HomeContent_page> createState() => _HomeContent_pageState();
}

class _HomeContent_pageState extends State<HomeContent_page> {
 
  // PageController pageController = PageController();
  int currentPage = 0;
  // final HomeProSlider=ProductSlider();
  
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
                SizedBox(height: 20),
            
            
               
            
                //promoBanner
               SizedBox(height: 189,
               child: PageView.builder(
                onPageChanged: (val){
                  setState(() {
                    currentPage=val;
                  });  
                },
                itemBuilder: (context, index) =>  promoBanner(),itemCount: 3,),
               ),

               SizedBox(height: 9,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          height:11,width:11,
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFDEDBDB),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: currentPage==index?Color(0xFFFFA3B3):Color(0xfDEDBDB),
                          ),
                          
                        ),
                      ),
                    ),
                SizedBox(height: 9),
                dealOfTheDayCard(),
                SizedBox(height: 20),
                ProductSlider()
                 
              ],
            ),
          ),
            
        )
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

  List<CollectionsModel> products = [
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


Widget promoBanner() {
  return Container(
    width: double.infinity,
    height: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("assets/ProBanner1.png"), // image
        fit: BoxFit.cover,
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "50-40% OFF",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Now in (product)",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        Text(
          "All colours",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Shop Now", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, size: 16),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget dealOfTheDayCard() {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 1),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color(0xFF3B88FD),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deal of the Day",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.timer_outlined, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "22h 55m 20s remaining",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Handle "View all"
          },
          child: Row(
            children: [
              Text("View all"),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 16),
            ],
          ),
        ),
      ],
    ),
  );
}


// Product Slider
