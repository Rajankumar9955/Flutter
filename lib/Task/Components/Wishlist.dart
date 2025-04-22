import 'package:flutter/material.dart';
import 'package:pro1/Task/Components/SearchSection.dart';
import 'package:pro1/Task/Models/CollectionsModel.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                    "${products.length}+ Items",
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
                    children: categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(category.Image),
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
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.75,
    ),
    itemBuilder: (context, index) {
      final product = products[index];
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(product.Image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.Name),
            ),
            // SizedBox(
            //   child: Text(product.Description),
            // )
            
          ],
        ),
      );
    },
  ),
),

            ],
          ),
        ),
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
          Text(label, style: TextStyle(fontWeight: FontWeight.w500,)),
          SizedBox(width: 4),
          Icon(icon, size: 18),
        ],
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

  List<CollectionsModel>products=[
              CollectionsModel(Image:"assets/beauty.jpg", Name: "Beauty", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",),
           CollectionsModel(Image: "assets/fashion.jpg", Name: "Fashion", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
           CollectionsModel(Image: "assets/kids.jpeg", Name: "Kids", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
           CollectionsModel(Image: "assets/mens.webp", Name: "Mens", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
           CollectionsModel(Image: "assets/women.jpeg", Name: "Womens", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
  ];
}



