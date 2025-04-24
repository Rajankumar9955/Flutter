
import 'package:get/get.dart';
import 'package:pro1/Getx/Models/product_model.dart';


class ProductControllers extends GetxController {
      List<Product>productData=[];

   fetchProductData(){
      List<Product>serverResponse=[
        Product(id: 1, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
        Product(id: 2, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
        Product(id: 3, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
        Product(id: 4, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
      ];
      productData.assignAll(serverResponse);
   }
}