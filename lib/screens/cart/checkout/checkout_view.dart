import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_textfield_checkout.dart';
import '../../mainScreen/main_screen_view.dart';
import '../cart_controller.dart';
import 'checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  final double subtotal;
  final double total;
  final VoidCallback onPlaceOrder;
  final CartController cartController;

  const CheckoutScreen({
    super.key,
    required this.subtotal,
    required this.total,
    required this.onPlaceOrder,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController = Get.put(CheckoutController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Order Summary Section
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal', style: TextStyle(fontSize: 18)),
                      Text(_formatCurrency(subtotal),
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Shipping', style: TextStyle(fontSize: 18)),
                      const Text('Flat Rate', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(_formatCurrency(total),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Checkout Form Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check out',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Name Fields
                  Row(
                    children: [
                      Expanded(
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('First Name'),
                            const SizedBox(height: 5),
                            CustomTextfieldCheckout(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Last Name'),
                            const SizedBox(height: 5),
                            CustomTextfieldCheckout(),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  const Text('Phone', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  CustomTextfield(
                    hinttext: 'Phone Number',
                    controller: TextEditingController(),
                  ),

                  const SizedBox(height: 10),
                  const Text('Email', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  CustomTextfield(
                    hinttext: 'Example@email.com',
                    controller: TextEditingController(),
                  ),

                  const SizedBox(height: 10),
                  const Text('Address', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  CustomTextfield(
                    hinttext: 'Address',
                    controller: TextEditingController(),
                  ),

                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Place Order',
                    onTap: () async {
                      try {
                        // Show loading dialog
                        Get.dialog(
                          AlertDialog(
                            content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 10),
                                Text("Processing your order..."),
                              ],
                            ),
                          ),
                          barrierDismissible: false, // Prevent closing by tapping outside
                        );

                        // Simulate API call delay (replace with actual `onPlaceOrder()`)
                        await Future.delayed(Duration(seconds: 2));

                        // Close loading dialog
                        Get.back();
cartController.cartItems.clear();
                        // Show success message
                        Get.snackbar(
                          "Success",
                          "Order placed successfully!",
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );

                        // Wait for the snackbar to disappear
                        await Future.delayed(Duration(seconds: 2));

                        // Navigate to MainScreen and clear all previous routes
                        Get.offAll(() => MainScreen());

                      } catch (e) {
                        // Close loading dialog if open
                        if (Get.isDialogOpen!) Get.back();

                        // Show error message
                        Get.snackbar(
                          "Error",
                          e.toString(),
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                  ),                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(double value) {
    try {
      // Ensure value is a valid double
      double safeValue = value is double ? value : 0.0;
      return '\$${safeValue.toStringAsFixed(2)}';
    } catch (e) {
      // Fallback in case of error
      print('Error formatting currency: $e');
      return '\$0.00';
    }
  }
}