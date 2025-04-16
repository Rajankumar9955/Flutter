import 'package:flutter/material.dart';
import 'package:pro1/2nd%20day/secondDay.dart';
import 'package:pro1/3rd%20day/model/productModel.dart';
import 'package:pro1/3rd%20day/product_detail_page.dart';
import 'package:pro1/theme/app_text.dart';


class LayoutWidget extends StatelessWidget {
   LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout widgets and Product Details"),),
      body: GridView.builder(itemCount: products.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 210),
       shrinkWrap: true,
       itemBuilder: (context,index){
        return CardWidget(
         data: products[index],
          );
       },
      ),
    );
  }


  List<Productmodel1> products=[
    Productmodel1(Image: "assets/realme8.jpg", name: "Realme 8", price: 20000.00 , decription: "realme 8 features a powerful Helio G95 Gaming Processor. 2.05GHz high-frequency Cortex-A76 CPU comes with powerful ARM G76 GPU, delivering a gaming experience with smoothness and high image quality. The massive 5000mAh battery can keep the phone in standby for up to 40 days."),
    Productmodel1(Image: "assets/Sam1.webp", name: "Samsung A12", price: 15000.00,decription: "realme 8 features a powerful Helio G95 Gaming Processor. 2.05GHz high-frequency Cortex-A76 CPU comes with powerful ARM G76 GPU, delivering a gaming experience with smoothness and high image quality. The massive 5000mAh battery can keep the phone in standby for up to 40 days."),
    Productmodel1(Image: "assets/iQoo.webp", name: "IQoo J12", price: 15564.00, decription: "The iQOO Neo9 Pro in Fiery Red is a powerful gaming and performance-oriented smartphone, featuring a high-refresh-rate display, a flagship-grade 50 MP camera, a long-lasting battery, and 5G connectivity. Designed for power users, gamers")
   
  ];
}

class CardWidget extends StatelessWidget {
  final Productmodel1 data;
 
  const CardWidget({
    super.key,
    required this.data,
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(
          product: data,
        ),));
      },
      child: Container(
       margin: EdgeInsets.all(20),
       padding: EdgeInsets.all(30),
       decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
        boxShadow:[ BoxShadow(
          color: Color.fromRGBO(255, 164, 173, 173),
          blurRadius: 2,
          offset: Offset(0, 1)
        ),]
       ),
       child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(data.Image, height: 140, width: 120,),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Name : ${data.name}", style: AppText.kText18w600,),
              Text("Price : ${data.price}", style: AppText.kText18w600,),
            ],
          )
        ],
       ),
        
      ),
    );
  }
}