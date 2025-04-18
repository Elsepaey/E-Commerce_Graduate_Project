// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/widgets/custom_shortbutton.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final ProductModel product;

//   ProductDetailScreen({required this.product});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _counter = 1;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     if (_counter > 1) {
//       setState(() {
//         _counter--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//         title: Center(
//           child: Text(
//             widget.product.name, // Display the product name
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 10.0), // Add horizontal padding
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 16), // Space between AppBar and Body
//             Stack(
//               children: [
//                 Image.network(
//                   widget.product.image,
//                   width: double.infinity,
//                   height: 250,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 30,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: Color(0XFF6F987C).withOpacity(0.7),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       '\$${widget.product.price}', // Display product price
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: kWhiteColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             Container(
//               height: 170,
//               width:
//                   double.infinity, // Change to double.infinity for full width
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Color(0XFF98CBB0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   widget.product.description, // Display product description
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 70),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 242, 236, 236),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: _decrementCounter,
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kPrimaryColor,
//                           ),
//                           child: Icon(
//                             Icons.remove,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           '$_counter',
//                           style: TextStyle(fontSize: 24),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _incrementCounter,
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kPrimaryColor,
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 10 ), // Space between counter and button
//                 CustomShortbutton(title: 'Add to Cart'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/widgets/custom_shortbutton.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final ProductModel product;

//   ProductDetailScreen({required this.product});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _counter = 1;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     if (_counter > 1) {
//       setState(() {
//         _counter--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//         title: Center(
//           child: Text(
//             widget.product.name, // Display the product name
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 10.0), // Add horizontal padding
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 16), // Space between AppBar and Body
//             Stack(
//               children: [
//                 Image.network(
//                   widget.product.image,
//                   width: double.infinity,
//                   height: 250,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 30,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: Color(0XFF6F987C).withOpacity(0.7),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       '\$${widget.product.price}', // Display product price
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: kWhiteColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             Container(
//               height: 170,
//               width: double.infinity, // Full width
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Color(0XFF98CBB0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   widget.product.description, // Display product description
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 70),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 242, 236, 236),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: _decrementCounter,
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kPrimaryColor,
//                           ),
//                           child: Icon(
//                             Icons.remove,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           '$_counter',
//                           style: TextStyle(fontSize: 24),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _incrementCounter,
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kPrimaryColor,
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 10), // Space between counter and button
//                 CustomShortbutton(title: 'Add to Cart'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//day
// import 'package:flutter/material.dart';
// import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/widgets/custom_shortbutton.dart';

// class ProductDetailScreen extends StatelessWidget {
//   final ProductModel product;

//   ProductDetailScreen({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(product.image, fit: BoxFit.cover, height: 250),
//             SizedBox(height: 10),
//             Text(
//               product.name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20, color: Colors.green),
//             ),
//             SizedBox(height: 10),
//             Text(
//               product.description,
//               style: TextStyle(fontSize: 16),
//             ),
//             Spacer(),
//             CustomShortbutton(title: 'Add to Cart'),
//           ],
//         ),
//       ),
//     );
//   }
// }

//after detail

// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/models/disply_product.dart';
// import 'package:graduate_project/widgets/custom_shortbutton.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final DisplyProduct product;

//   ProductDetailScreen({required this.product});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {

//   int _counter = 1;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     if (_counter > 1) {
//       setState(() {
//         _counter--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.product.name ?? 'No Name'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               widget.product.image ?? '',
//               fit: BoxFit.cover,
//               height: 250,
//               errorBuilder: (context, error, stackTrace) =>
//                   Icon(Icons.image_not_supported, size: 100),
//             ),
//             SizedBox(height: 10),
//             Text(
//               widget.product.name ?? 'No Name',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '\$${double.tryParse(widget.product.price ?? '0.0')?.toStringAsFixed(2) ?? '0.00'}',
//               style: TextStyle(fontSize: 20, color: Colors.green),
//             ),
//             SizedBox(height: 10),
//             Text(
//               widget.product.description ?? 'No Description',
//               style: TextStyle(fontSize: 16),
//             ),
//             Spacer(),

//  Row(
//                     children: [
//                       GestureDetector(
//                         onTap: _decrementCounter,
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kPrimaryColor,
//                           ),
//                           child: Icon(
//                             Icons.remove,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           '$_counter',
//                           style: TextStyle(fontSize: 24),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _incrementCounter,
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kPrimaryColor,
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),

//               SizedBox(width: 30,),

//                 CustomShortbutton(title: 'Add to Cart'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/models/disply_product.dart';
import 'package:graduate_project/screens/wishlist/favourite_button.dart';
import 'package:graduate_project/widgets/custom_shortbutton.dart';

import 'cart/cart_controller.dart';
import 'cart/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDM product;
  final bool isFav;

  ProductDetailScreen({required this.product, required this.isFav});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CartController cartController = Get.find();

  late bool _isFav; // Local state to track favorite status
  int counter = 1;

  @override
  void initState() {
    super.initState();
    _isFav = widget.isFav; // Initialize with the passed value
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  // Add this method to update favorite status
  void _updateFavoriteStatus(bool newStatus) {
    setState(() {
      _isFav = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          FavouriteButton(
            widget.product,
            _isFav,
            onStatusChanged: _updateFavoriteStatus, // Pass the callback
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Image.network(
                      widget.product.image ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported, size: 100),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 138, 193, 141),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '\$${double.tryParse(widget.product.price ?? '0.0')?.toStringAsFixed(2) ?? '0.00'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // ⭐ Star and Rating Positioned at Bottom Right
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text(
                            widget.product.rating?.toStringAsFixed(1) ?? '4.9',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Product Name
              Text(
                widget.product.name ?? 'No Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.product.description ?? 'No Description',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _decrementCounter,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '$counter',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  GestureDetector(
                    onTap: _incrementCounter,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  CustomShortbutton(title: 'Add to Cart',onPressed: (){
                    cartController.addToCart(CartItem(product: widget.product, quantity: counter));

                  },),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),    );
  }
}
