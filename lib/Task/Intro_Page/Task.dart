import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:pro1/3rd%20day/product_detail_page.dart';
import 'package:pro1/Task/LoginSection/Login_Page.dart';
import 'package:pro1/Task/Intro_Page/model/IntroPageModel.dart';

class TaskBySir extends StatefulWidget {
     ///////////
  const TaskBySir({super.key,
           //////////
  });

  @override
  State<TaskBySir> createState() => _EcommerceState();
}

class _EcommerceState extends State<TaskBySir> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(
                      " ${currentPage+1}/3",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 3, 2),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        
                      ),
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  Container(
                    //  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: 
                    InkWell (
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      },child: Text(
                      "Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 3, 2),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                      ),
                      )
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    currentPage = value;
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CustomSliderWidget(
                      product: products[index],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  if (currentPage > 0) InkWell(
                    onTap: (){
                      setState(() {
                        currentPage--;
                        pageController.previousPage(duration: Duration(microseconds: 300), curve: Curves.bounceIn);
                      });
                    },
                    child: Text("Prev")),

                  Expanded(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),

                    // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 16, 15, 15),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          height: 12,
                          width: currentPage == index ? 30 : 10,
                        ),
                      ),
                    ),
                    
                  ),
                  

                  InkWell(
                    onTap:
                        currentPage < products.length-1
                            ? () {
                              setState(() {
                                currentPage++;
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceIn,
                                );
                              });
                            }
                            : () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                            },
                    child: Text(
                      currentPage == 2 ? "Get Started" : "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  
                ],
                
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
  List<ProDetailsModel>products=[
    ProDetailsModel(Image:"assets/fash.png", Name: "Choose Products", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",),
    ProDetailsModel(Image: "assets/fash1.png", Name: "Make Payment", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
    ProDetailsModel(Image: "assets/fash2.png", Name: "Get Your Order", Description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
  ];
}

class CustomSliderWidget extends StatelessWidget {
    final ProDetailsModel product;
  const CustomSliderWidget({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(product.Image),
        Text(
          product.Name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            // fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(product.Description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromARGB(26, 33, 29, 29),
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
    
  }
}
