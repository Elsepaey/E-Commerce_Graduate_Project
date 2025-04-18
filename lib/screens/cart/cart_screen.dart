import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'package:graduate_project/widgets/custom_textfield_checkout.dart';

import '../../models/disply_product.dart';
import 'cart_controller.dart';
import 'checkout/checkout_view.dart';

class CartItem {
  final ProductDM product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  CartItem copyWith({
    ProductDM? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'SettingScreen');
            },
            icon: Icon(Icons.list),
          ),
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ProfileScreen');
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 30),
            Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 244, 244),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 325,
                height: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Text(
                        'Find plant',
                        style: TextStyle(
                          color: const Color.fromARGB(221, 150, 148, 148),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                          size: 100, color: Colors.grey),
                      Text('Your cart is empty'),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  ...cartController.cartItems
                      .map((item) => CartItemWidget(item: item))
                      .toList(),
                  const Divider(),
                  CustomButton(
                    title: "Confirm Order",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                    subtotal: cartController.subtotal.value,
                                    total: cartController.total.value,
                                    onPlaceOrder: () {
                                      // Handle the order placement
                                      //checkoutController.placeOrder();
                                    },
                                    cartController: cartController,
                                  )));
                    },
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final CartController cartController = Get.find();

  CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${item.product.price}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  cartController.updateQuantity(
                    item.product,
                    cartController.getQuantity(item.product) - 1,
                  );
                },
              ),
              Text(item.quantity.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  cartController.updateQuantity(
                    item.product,
                    cartController.getQuantity(item.product) + 1,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
