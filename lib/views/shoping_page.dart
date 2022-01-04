import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managment/controllers/cart_controller.dart';
import 'package:state_managment/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.black,
            ),
            backgroundColor: Colors.amber,
            label: GetX<CartController>(builder: (controller) {
              return Text(controller.count.toString(),style: TextStyle(color: Colors.black,fontSize: 24),);
            })),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(12),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .products[index].productName,
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(controller.products[index]
                                            .productDescription),
                                      ],
                                    ),
                                    Text(
                                        '\$${controller.products[index].price}')
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  child: Text("Add To cart"),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              GetX<CartController>(builder: (controller) {
                return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      'Totol Amount: \$ ${controller.totalPrice}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ));
              }),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
