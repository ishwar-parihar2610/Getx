import 'package:get/get.dart';
import 'package:state_managment/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    await Future.delayed(Duration(seconds: 1));
    var serverRespons = [
      Product(
          id: 1,
          productName: 'FirstProd',
          productimage: 'abd',
          productDescription: 'some description about Product',
          price: 30),
      Product(
          id: 2,
          productName: 'Second Product',
          productimage: 'abd',
          productDescription: 'some description about Product',
          price: 40),
      Product(
          id: 3,
          productName: 'Second Product',
          productimage: 'abd',
          productDescription: 'some description about Product',
          price: 49.5),
      Product(
          id: 4,
          productName: 'fourth Product',
          productimage: 'abd',
          productDescription: 'some description about Product',
          price: 25),
      Product(
          id: 2,
          productName: 'Fifth Product',
          productimage: 'abd',
          productDescription: 'some description about Product',
          price: 100)
    ];

    products.value = serverRespons;
  }
}
