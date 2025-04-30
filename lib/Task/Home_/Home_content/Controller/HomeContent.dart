import 'package:get/get.dart';

class HomeContentController extends GetxController {
  var currentPage = 0.obs;

  void promoBanner(int index) {
    currentPage.value = index;
  }
}