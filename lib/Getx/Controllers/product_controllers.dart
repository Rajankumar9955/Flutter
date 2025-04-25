
import 'package:get/get.dart';
import 'package:pro1/Getx/Models/product_model.dart';


class ProductControllers extends GetxController {
      List<Product>productData=[];

      List<Product>cartItem   = List<Product>.empty().obs;

      addtoCart(Product item){
        cartItem.add(item);
      }

      double get totalPrice => cartItem.fold(0, (sum, item)=>sum+ item.price);
      int get count => cartItem.length;

      @override
      void onInit(){
        super.onInit();
        fetchProductData();
      }

   fetchProductData() async{

     await Future.delayed(Duration(seconds:15));

      List<Product>serverResponse=[
        Product(id: 1, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
        Product(id: 2, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
        Product(id: 3, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
        Product(id: 4, productName: "Apple", productImage: "assets/applelogo.jpeg", productDescription: "Some description about product", price: 499, favorite: false),
      ];
      productData.assignAll(serverResponse);
      print(productData);
      update();
   }
   addtoFavorite(id){
    var index=productData.indexWhere((element)=>element.id==id);
    productData[index].favorite=!productData[index].favorite;
    update();
   }
}