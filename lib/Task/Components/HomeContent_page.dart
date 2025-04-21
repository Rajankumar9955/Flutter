
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
   Scaffold(
    appBar: AppBar(
  automaticallyImplyLeading: false, // hides the back button
  title: Text('All Featured', style: TextStyle(color: Colors.black)),
  backgroundColor: Colors.white,
  elevation: 0,
  actions: [
     Text("Sort"),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.sort, color: Colors.black),
    ),
     Text("Filter"),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.filter_alt, color: Colors.black),
    ),
  ],
),
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