// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:graduate_project/services/product_service.dart';
// import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/widgets/custom_textfield_stack.dart';
// import 'package:graduate_project/widgets/custom_container_navbar.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';

// class ShopScreen extends StatefulWidget {
//   @override
//   State<ShopScreen> createState() => _ShopScreenState();
// }

// class _ShopScreenState extends State<ShopScreen> {
//   List<ProductModel> products = [];
//   List<ProductModel> displayedProducts = [];
//   bool isLoading = true;
//   String? errorMessage;
//   String selectedCategory = 'All';
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//   }

//   Future<void> _fetchProducts({String keyword = ''}) async {
//     try {
//       var service = ProductService(dio: Dio());
//       List<ProductModel> fetchedProducts =
//           await service.getProduct(keyword: keyword);

//       const String baseUrl = 'https://habibaelbehairy.pythonanywhere.com';
//       for (var product in fetchedProducts) {
//         if (!product.image.startsWith('http')) {
//           product.image = '$baseUrl${product.image}';
//         }
//       }

//       setState(() {
//         products = fetchedProducts;
//         displayedProducts = fetchedProducts; // Initialize displayed products
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = "Failed to load products. Please try again.";
//         isLoading = false;
//       });
//     }
//   }

//   void _filterProducts(String category) {
//     setState(() {
//       selectedCategory = category;
//       if (category == 'All') {
//         displayedProducts = products;
//       } else {
//         displayedProducts =
//             products.where((product) => product.category == category).toList();
//       }
//     });
//   }

//   void _searchProducts(String query) {
//     setState(() {
//       displayedProducts = products.where((product) {
//         return product.name.toLowerCase().startsWith(query.toLowerCase());
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(243, 255, 255, 255),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, 'SettingScreen');
//             },
//             icon: Icon(Icons.list),
//           ),
//         ],
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'ProfileScreen');
//               },
//               child: ClipOval(
//                 child: Image.asset(
//                   'assets/images/avatar.jpeg',
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hello guest',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Start Exploring Plants',
//                   style: TextStyle(
//                       color: const Color.fromRGBO(158, 158, 158, 1),
//                       fontSize: 16),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : errorMessage != null
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(errorMessage!,
//                           style: TextStyle(color: Colors.red, fontSize: 16)),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                           onPressed: _fetchProducts, child: Text('Retry')),
//                     ],
//                   ),
//                 )
//               : displayedProducts.isEmpty
//                   ? Center(
//                       child: Text('No products available.',
//                           style: TextStyle(fontSize: 18, color: Colors.grey)))
//                   : Column(
//                       children: [
//                         // Search bar
//                         Container(
//                           margin: EdgeInsets.only(top: 20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           width: 325,
//                           height: 40,
//                           child: Row(
//                             children: [
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.search),
//                                   color: Colors.black),
//                               Expanded(
//                                 child: TextField(
//                                   controller: searchController,
//                                   onChanged: _searchProducts,
//                                   decoration: InputDecoration(
//                                     hintText: 'Find plant',
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         CustomTextfieldStack(),
//                         SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Row(
//                             children: [
//                               CustomCategoryButton(
//                                 title: 'All',
//                                 isSelected: selectedCategory == 'All',
//                                 onPressed: () => _filterProducts('All'),
//                               ),
//                               SizedBox(width: 20),
//                               CustomCategoryButton(
//                                 title: 'Plants',
//                                 isSelected: selectedCategory == 'Plants',
//                                 onPressed: () => _filterProducts('Plants'),
//                               ),
//                               SizedBox(width: 20),
//                               CustomCategoryButton(
//                                 title: 'Pots',
//                                 isSelected: selectedCategory == 'Pots',
//                                 onPressed: () => _filterProducts('Pots'),
//                               ),
//                               SizedBox(width: 20),
//                               CustomCategoryButton(
//                                 title: 'Seeds',
//                                 isSelected: selectedCategory == 'Seeds',
//                                 onPressed: () => _filterProducts('Seeds'),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 20, left: 25, right: 18),
//                             child: GridView.builder(
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 childAspectRatio: 2 / 3,
//                                 crossAxisSpacing: 10,
//                                 mainAxisSpacing: 5,
//                               ),
//                               itemCount: displayedProducts.length,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ProductDetailScreen(
//                                                   product: displayedProducts[
//                                                       index]
//                                                       )
//                                                       ),
//                                     );
//                                   },
//                                   child: GridTile(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(15),
//                                             child: Image.network(
//                                               displayedProducts[index].image,
//                                               fit: BoxFit.cover,
//                                               errorBuilder:
//                                                   (context, error, stackTrace) {
//                                                 return Center(
//                                                     child: Icon(
//                                                         Icons.broken_image,
//                                                         color: Colors.grey));
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                   displayedProducts[index].name,
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               Text(
//                                                   '\$${displayedProducts[index].price.toStringAsFixed(2)}',
//                                                   style: TextStyle(
//                                                       color: Colors.green)),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         CustomContainerNavbar(),
//                       ],
//                     ),
//     );
//   }
// }

// // Modify CustomCategoryButton to accept isSelected and onPressed
// class CustomCategoryButton extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final VoidCallback onPressed;

//   CustomCategoryButton({
//     required this.title,
//     required this.isSelected,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected
//             ? const Color.fromARGB(255, 38, 79, 39)
//             : Colors.grey, // Change color based on selection
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white, // Adjust text color for better visibility
//           fontSize: 16, // Set a readable font size
//         ),
//       ),
//     );
//   }
// }

//original with api

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/product/product_state.dart';
// import 'package:graduate_project/cubits/profile/profile_cubit.dart';
// import 'package:graduate_project/cubits/profile/profile_state.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/signup_screen.dart';
// import 'package:graduate_project/widgets/Custom_textfield_stack.dart';
// import 'package:graduate_project/widgets/custom_category_button.dart' show CustomCategoryButton;
// import 'package:graduate_project/widgets/custom_container_navbar.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ShopScreen extends StatefulWidget {
//   ShopScreen({super.key});

//   @override
//   State<ShopScreen> createState() => _ShopScreenState();
// }

// class _ShopScreenState extends State<ShopScreen> {

//   final List<Map<String, String>> plants = [
//     {
//       "name": "Fiddle Leaf Fig",
//       "price": "\$250",
//       "image": "assets/images/product13.jpeg"
//     },
//     {
//       "name": "Snake Plant",
//       "price": "\$150",
//       "image": "assets/images/product13.jpeg"
//     },
//     {"name": "Pothos", "price": "\$100", "image": "assets/images/seed3.jpeg"},
//     {
//       "name": "Peace Lily",
//       "price": "\$200",
//       "image": "assets/images/seed8.jpeg"
//     },
//     {
//       "name": "Fiddle Leaf Fig",
//       "price": "\$250",
//       "image": "assets/images/product13.jpeg"
//     },
//     {
//       "name": "Snake Plant",
//       "price": "\$150",
//       "image": "assets/images/product13.jpeg"
//     },
//     {"name": "Pothos", "price": "\$100", "image": "assets/images/seed3.jpeg"},
//     {
//       "name": "Peace Lily",
//       "price": "\$200",
//       "image": "assets/images/seed8.jpeg"
//     },
//     {
//       "name": "Fiddle Leaf Fig",
//       "price": "\$250",
//       "image": "assets/images/product13.jpeg"
//     },
//     {
//       "name": "Snake Plant",
//       "price": "\$150",
//       "image": "assets/images/product13.jpeg"
//     },
//     {"name": "Pothos", "price": "\$100", "image": "assets/images/seed3.jpeg"},
//     {
//       "name": "Peace Lily",
//       "price": "\$200",
//       "image": "assets/images/seed8.jpeg"
//     },
//   ];

//   @override

//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductCubit()..getProducts(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'SettingScreen');
//               },
//               icon: Icon(Icons.list, color: Colors.black),
//             ),
//           ],
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'ProfileScreen');
//                 },
//                 child: ClipOval(
//                   child: Image.asset(
//                     'assets/images/avatar.jpeg',
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Icon(Icons.person, size: 50, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BlocBuilder<ProfileCubit, ProfileState>(
//                     builder: (context, state) {
//                       if (state.profileStateStatus ==
//                               ProfileStateStatus.updateLoading ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.updateError ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.loading ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.error) {
//                         return Skeletonizer(
//                           child: Text(
//                             'Hello guest',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         );
//                       }
//                       return Text(
//                         state.profileResponseModel!.firstName!,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     },
//                   ),
//                   Text(
//                     'Start Exploring Plants',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
//                   ],
//                 ),
//                 width: 325,
//                 height: 40,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.search, color: Colors.black),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Find plant',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               CustomTextfieldStack(),

//               SizedBox(height: 20),
//               BlocBuilder<ProductCubit, ProductState>(
//                 builder: (context, state) {
//                   print('*********************');
//                   print(state.status);
//                    print('*********************');
//                   if (state.status == ProductStateStatus.loading ||
//                       state.status == ProductStateStatus.error) {
//                     return Skeletonizer(
//                       child: SizedBox(
//                         height: 400,
//                         child: GridView.builder(
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 0.8,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                           ),
//                           itemCount: plants.length,
//                           itemBuilder: (context, index) {
//                             // Default placeholder image if the image is null or invalid
//                             String imagePath = plants[index]["image"] ??
//                                 "assets/images/placeholder.png";

//                             return Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(15),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.shade300,
//                                       blurRadius: 5)
//                                 ],
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 120,
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       imagePath,
//                                       fit: BoxFit.contain,
//                                       errorBuilder:
//                                           (context, error, stackTrace) => Icon(
//                                               Icons.image_not_supported,
//                                               size: 50,
//                                               color: Colors.grey),
//                                     ),
//                                   ),
//                                   Divider(color: Colors.grey.shade300),
//                                   Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           plants[index]["name"] ??
//                                               "Unknown Plant",
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         SizedBox(height: 4),
//                                         SizedBox(height: 4),
//                                         Text(
//                                           plants[index]["price"] ?? "N/A",
//                                           style: TextStyle(
//                                             color: Colors.green,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   }
//                   if (state.status == ProductStateStatus.sucess) {
//                     return SizedBox(
//                       height: 400,
//                       child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 0.8,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: state.productsModel!.length,
//                         itemBuilder: (context, index) {
//                           // Default placeholder image if the image is null or invalid
//                           String imagePath = state.productsModel![index].image!;

//                           return Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey.shade300, blurRadius: 5)
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 120,
//                                   alignment: Alignment.center,
//                                   child: Image.asset(
//                                     imagePath,
//                                     fit: BoxFit.contain,
//                                     errorBuilder:
//                                         (context, error, stackTrace) => Icon(
//                                             Icons.image_not_supported,
//                                             size: 50,
//                                             color: Colors.grey),
//                                   ),
//                                 ),
//                                 Divider(color: Colors.grey.shade300),
//                                 Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         state.productsModel![index].name!,
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       SizedBox(height: 4),
//                                       SizedBox(height: 4),
//                                       Text(
//                                         state.productsModel![index].price!,
//                                         style: TextStyle(
//                                           color: Colors.green,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }

//                   return SizedBox(
//                     child: Center(
//                       child: Text('I have some Probleam ....'),
//                     ),
//                   );
//                 },
//               ),
//               CustomContainerNavbar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//  }

//after detail

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/product/product_state.dart';
// //import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';
// import 'package:graduate_project/widgets/custom_container_navbar.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ShopScreen extends StatefulWidget {
//   ShopScreen({super.key});

//   @override
//   State<ShopScreen> createState() => _ShopScreenState();
// }

// class _ShopScreenState extends State<ShopScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductCubit()..getProducts(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Text("Shop"),
//         ),
//         body: BlocBuilder<ProductCubit, ProductState>(
//           builder: (context, state) {
//             if (state.status == ProductStateStatus.loading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state.status == ProductStateStatus.error) {
//               return Center(child: Text('Failed to load products'));
//             } else if (state.status == ProductStateStatus.sucess) {
//               return GridView.builder(
//                 padding: EdgeInsets.all(10),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.8,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: state.productsModel!.length,
//                 itemBuilder: (context, index) {
//                   final product = state.productsModel![index];

//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProductDetailScreen(
//                             product: product,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.network(
//                             product.image!,
//                             height: 120,
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 Icon(Icons.image_not_supported, size: 50),
//                           ),
//                           Divider(color: Colors.grey.shade300),
//                           Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Column(
//                               children: [
//                                 Text(
//                                   product.name!,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   '\$${product.price!}',
//                                   style: TextStyle(
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             return Center(child: Text('No products available.'));
//           },
//         ),
//         bottomNavigationBar: CustomContainerNavbar(),
//       ),
//     );
//   }
// // }

// //night
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/product/product_state.dart';
// import 'package:graduate_project/cubits/profile/profile_cubit.dart';
// import 'package:graduate_project/cubits/profile/profile_state.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';
// import 'package:graduate_project/widgets/custom_container_navbar.dart';
// import 'package:graduate_project/widgets/custom_textfield_stack.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ShopScreen extends StatefulWidget {
//   ShopScreen({super.key});

//   @override
//   State<ShopScreen> createState() => _ShopScreenState();
// }

// class _ShopScreenState extends State<ShopScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductCubit()..getProducts(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'SettingScreen');
//               },
//               icon: Icon(Icons.list, color: Colors.black),
//             ),
//           ],
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'ProfileScreen');
//                 },
//                 child: ClipOval(
//                   child: Image.asset(
//                     'assets/images/avatar.jpeg',
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Icon(Icons.person, size: 50, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BlocBuilder<ProfileCubit, ProfileState>(
//                     builder: (context, state) {
//                       if (state.profileStateStatus ==
//                               ProfileStateStatus.updateLoading ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.updateError ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.loading ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.error) {
//                         return Skeletonizer(
//                           child: Text(
//                             'Hello guest',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         );
//                       }
//                       return Text(
//                         state.profileResponseModel!.firstName!,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     },
//                   ),
//                   Text(
//                     'Start Exploring Plants',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
//                   ],
//                 ),
//                 width: 325,
//                 height: 40,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.search, color: Colors.black),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Find plant',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               CustomTextfieldStack(),
//               SizedBox(height: 20),
//               BlocBuilder<ProductCubit, ProductState>(
//                 builder: (context, state) {
//                   if (state.status == ProductStateStatus.loading) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state.status == ProductStateStatus.error) {
//                     return Center(child: Text('Failed to load products'));
//                   } else if (state.status == ProductStateStatus.sucess) {
//                     return GridView.builder(
//                       padding: EdgeInsets.all(10),
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 0.8,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: state.productsModel!.length,
//                       itemBuilder: (context, index) {
//                         final product = state.productsModel![index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailScreen(
//                                   product: product,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey.shade300, blurRadius: 5)
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.network(
//                                   product.image!,
//                                   height: 120,
//                                   fit: BoxFit.contain,
//                                   errorBuilder: (context, error, stackTrace) =>
//                                       Icon(Icons.image_not_supported, size: 50),
//                                 ),
//                                 Divider(color: Colors.grey.shade300),
//                                 Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         product.name!,
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       SizedBox(height: 4),
//                                       Text(
//                                         '\$${product.price!}',
//                                         style: TextStyle(
//                                           color: Colors.green,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                   return Center(child: Text('No products available.'));
//                 },
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: CustomContainerNavbar(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/product/product_state.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';
// import 'package:graduate_project/widgets/custom_container_navbar.dart';
// import 'package:graduate_project/widgets/custom_textfield_stack.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ShopScreen extends StatefulWidget {
//   ShopScreen({super.key});

//   @override
//   State<ShopScreen> createState() => _ShopScreenState();
// }

// class _ShopScreenState extends State<ShopScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductCubit()..getProducts(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'SettingScreen');
//               },
//               icon: Icon(Icons.list, color: Colors.black),
//             ),
//           ],
//           title: Text(
//             'Shop',
//             style: TextStyle(
//                 color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               CustomTextfieldStack(),
//               SizedBox(height: 20),
//               BlocBuilder<ProductCubit, ProductState>(
//                 builder: (context, state) {
//                   if (state.status == ProductStateStatus.loading) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state.status == ProductStateStatus.error) {
//                     return Center(child: Text('Failed to load products'));
//                   } else if (state.status == ProductStateStatus.sucess) {
//                     return GridView.builder(
//                       padding: EdgeInsets.all(10),
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 0.8,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: state.productsModel!.length,
//                       itemBuilder: (context, index) {
//                         final product = state.productsModel![index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailScreen(
//                                   product: product,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.shade300,
//                                       blurRadius: 5,
//                                     )
//                                   ],
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.network(
//                                       product.image!,
//                                       height: 120,
//                                       fit: BoxFit.contain,
//                                       errorBuilder:
//                                           (context, error, stackTrace) => Icon(
//                                               Icons.image_not_supported,
//                                               size: 50),
//                                     ),
//                                     Divider(color: Colors.grey.shade300),
//                                     Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             product.name!,
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                           SizedBox(height: 4),
//                                           Text(
//                                             '\$${product.price!}',
//                                             style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 left: 8,
//                                 child: Icon(Icons.shopping_cart,
//                                     color: Colors.grey),
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 right: 8,
//                                 child: Icon(Icons.favorite_border,
//                                     color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                   return Center(child: Text('No products available.'));
//                 },
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: CustomContainerNavbar(),
//       ),
//     );
//   }
//}

//  import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/product/product_state.dart';
// import 'package:graduate_project/cubits/profile/profile_cubit.dart';
// import 'package:graduate_project/cubits/profile/profile_state.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';
// import 'package:graduate_project/widgets/custom_container_navbar.dart';
// import 'package:graduate_project/widgets/custom_textfield_stack.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ShopScreen extends StatefulWidget {
//   ShopScreen({super.key});

//   @override
//   State<ShopScreen> createState() => _ShopScreenState();
// }

// class _ShopScreenState extends State<ShopScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductCubit()..getProducts(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'SettingScreen');
//               },
//               icon: Icon(Icons.list, color: Colors.black),
//             ),
//           ],
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, 'ProfileScreen');
//                 },
//                 child: ClipOval(
//                   child: Image.asset(
//                     'assets/images/avatar.jpeg',
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Icon(Icons.person, size: 50, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BlocBuilder<ProfileCubit, ProfileState>(
//                     builder: (context, state) {
//                       if (state.profileStateStatus ==
//                               ProfileStateStatus.updateLoading ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.updateError ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.loading ||
//                           state.profileStateStatus ==
//                               ProfileStateStatus.error) {
//                         return Skeletonizer(
//                           child: Text(
//                             'Hello guest',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         );
//                       }
//                       return Text(
//                         state.profileResponseModel!.firstName!,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     },
//                   ),
//                   Text(
//                     'Start Exploring Plants',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
//                   ],
//                 ),
//                 width: 325,
//                 height: 40,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.search, color: Colors.black),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Find plant',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               CustomTextfieldStack(),
//               SizedBox(height: 20),
//               BlocBuilder<ProductCubit, ProductState>(
//                 builder: (context, state) {
//                   if (state.status == ProductStateStatus.loading) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state.status == ProductStateStatus.error) {
//                     return Center(child: Text('Failed to load products'));
//                   } else if (state.status == ProductStateStatus.sucess) {
//                     return GridView.builder(
//                       padding: EdgeInsets.all(10),
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 0.8,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: state.productsModel!.length,
//                       itemBuilder: (context, index) {
//                         final product = state.productsModel![index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailScreen(
//                                   product: product,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.shade300,
//                                       blurRadius: 5,
//                                     )
//                                   ],
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.network(
//                                       product.image!,
//                                       height: 120,
//                                       fit: BoxFit.contain,
//                                       errorBuilder:
//                                           (context, error, stackTrace) => Icon(
//                                               Icons.image_not_supported,
//                                               size: 50),
//                                     ),
//                                     Divider(color: Colors.grey.shade300),
//                                     Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             product.name!,
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                           SizedBox(height: 4),
//                                           Text(
//                                             '\$${product.price!}',
//                                             style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

// Positioned(
//                                 top: 8,
//                                 left: 8,
//                                 child: Icon(Icons.shopping_cart,
//                                     color: Colors.grey),
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 right: 8,
//                                 child: Icon(Icons.favorite_border,
//                                     color: Colors.grey),
//                               ),

//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                   return Center(child: Text('No products available.'));
//                 },
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: CustomContainerNavbar(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/cubits/product/product_cubit.dart';
import 'package:graduate_project/cubits/product/product_state.dart';
import 'package:graduate_project/cubits/profile/profile_cubit.dart';
import 'package:graduate_project/cubits/profile/profile_state.dart';
import 'package:graduate_project/screens/product_detail_screen.dart';
import 'package:graduate_project/screens/wishlist/favourite_button.dart';
import 'package:graduate_project/screens/wishlist/wishlist_cubit.dart';
import 'package:graduate_project/utils/app_responsive.dart';
import 'package:graduate_project/widgets/custom_container_navbar.dart';
import 'package:graduate_project/widgets/custom_textfield_stack.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key}) {
    wishlistCubit.loadWishlist();
  }

  WishlistCubit wishlistCubit = WishlistCubit();
  @override
  Widget build(BuildContext context) {
    print(wishlistCubit.wishlistItems);
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'SettingScreen');
              },
              icon: const Icon(Icons.list, color: Colors.black),
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
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state.profileStateStatus ==
                              ProfileStateStatus.updateLoading ||
                          state.profileStateStatus ==
                              ProfileStateStatus.updateError ||
                          state.profileStateStatus ==
                              ProfileStateStatus.loading ||
                          state.profileStateStatus ==
                              ProfileStateStatus.error) {
                        return const Skeletonizer(
                          child: Text(
                            'Hello guest',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return Text(
                        state.profileResponseModel?.firstName ?? "un Known",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  const Text(
                    'Start Exploring Plants',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                  ],
                ),
                width: 325,
                height: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.black),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Find plant',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Button Section for All, Plants, Pots, Seeds

              CustomTextfieldStack(),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigate to All Products
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("All",
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Plants
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Plants",
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Pots
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Pots",
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Seeds
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Seeds",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state.status == ProductStateStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == ProductStateStatus.error) {
                    return const Center(child: Text('Failed to load products'));
                  } else if (state.status == ProductStateStatus.sucess) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.productsModel!.length,
                      itemBuilder: (context, index) {
                        final product = state.productsModel![index];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    product.image,
                                    height: 105.h(),
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error,
                                            stackTrace) =>
                                         Icon(Icons.image_not_supported,
                                            size: 50.s()),
                                  ),
                                  Divider(color: Colors.grey.shade300),
                                  GestureDetector(
                                    child: Padding(
                                      padding:  EdgeInsets.all(10.s()),
                                      child: Column(
                                        children: [
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '\$${product.price!}',
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                            product: product,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 8,
                              left: 8,
                              child:
                                  Icon(Icons.shopping_cart, color: Colors.grey),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: BlocBuilder<WishlistCubit, WishlistState>(
                                builder: (context, wishlistState) {
                                  final wishlistCubit = context.watch<
                                      WishlistCubit>(); // Listen for changes

                                  final isInWishlist = wishlistCubit
                                      .wishlistItems
                                      .any((item) => item.id == product.id);

                                  return FavouriteButton(
                                    product,
                                    isInWishlist,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(child: Text('No products available.'));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomContainerNavbar(),
      ),
    );
  }
}
