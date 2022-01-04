import 'package:get/get.dart';
import 'package:state_managment/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get count => cartItems.length;
  
  addToCart(Product product) {
    cartItems.add(product);
  }
}
