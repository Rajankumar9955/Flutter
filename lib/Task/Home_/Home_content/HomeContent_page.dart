import 'package:flutter/material.dart';
import 'package:pro1/2nd%20day/model/product_model.dart';
import 'package:pro1/Task/Home_/DealOfTheDay/DealOfTheDay_page.dart';
import 'package:pro1/Task/Home_/ProductSliders/HomeProductSlider_page.dart';
import 'package:pro1/Task/Models/Categories.dart';
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
                dealOfTheDayCard(context),
                SizedBox(height: 20),
                ProductSlider()
                 
              ],
            ),
          ),
            
        )
      ),
    );
  }

  final List<CollectionsModel> categories = [
    CollectionsModel(Name: 'Beauty', imagePath: 'assets/beauty.jpg', Description: 'sdfaskjdfkasdkjfhsak'),
    CollectionsModel(Name: 'Fashion', imagePath: 'assets/fashion.jpg', Description: 'sdfaskjdfkasdkjfhsak'),
    CollectionsModel(Name: 'Kids', imagePath: 'assets/kids.jpeg', Description: 'sdfaskjdfkasdkjfhsak'),
    CollectionsModel(Name: 'Mens', imagePath: 'assets/mens.webp', Description: 'sdfaskjdfkasdkjfhsak'),
    CollectionsModel(Name: 'Womens', imagePath: 'assets/women.jpeg', Description: 'sdfaskjdfkasdkjfhsak'),
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


class Category {
  final String name;
  final String imagePath;
  Category(this.name, this.imagePath);
}
class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(category.imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
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

Widget dealOfTheDayCard(BuildContext context) {
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
             Navigator.push(context, MaterialPageRoute(builder: (context)=>DealOfTheDayProducts()));
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
