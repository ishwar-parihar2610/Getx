import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managment/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    onPressed: () {},
                                    child: Text("Add To cart"))
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              Text('Totol Amount: '),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
