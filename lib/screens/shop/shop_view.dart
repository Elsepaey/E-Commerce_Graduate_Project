// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/cubits/product/product_state.dart';
// import 'package:graduate_project/cubits/profile/profile_state.dart';
// import 'package:graduate_project/screens/wishlist/favourite_button.dart';
// import 'package:graduate_project/utils/app_responsive.dart';
// import 'package:graduate_project/widgets/custom_textfield_stack.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// import '../../cubits/product/product_cubit.dart';
// import '../../cubits/profile/profile_cubit.dart';
// import '../wishlist/wishlist_cubit.dart';
// import 'shop_controller.dart';
//
// class ShopView extends StatelessWidget {
//    ShopView({super.key});
// ShopController controller=Get.put(ShopController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: controller.navigateToSettings,
//             icon: const Icon(Icons.list, color: Colors.black),
//           ),
//         ],
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: controller.navigateToProfile,
//               child: ClipOval(
//                 child: Image.asset(
//                   'assets/images/avatar.jpeg',
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.person, size: 50, color: Colors.grey),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BlocBuilder<ProfileCubit, ProfileState>(
//                   builder: (context, state) {
//                     if (state.profileStateStatus ==
//                         ProfileStateStatus.updateLoading ||
//                         state.profileStateStatus ==
//                             ProfileStateStatus.updateError ||
//                         state.profileStateStatus ==
//                             ProfileStateStatus.loading ||
//                         state.profileStateStatus == ProfileStateStatus.error) {
//                       return const Skeletonizer(
//                         child: Text(
//                           'Hello guest',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       );
//                     }
//                     return Text(
//                       state.profileResponseModel?.firstName ?? "un Known",
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   },
//                 ),
//                 const Text(
//                   'Start Exploring Plants',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
//                 ],
//               ),
//               width: 325,
//               height: 40,
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.search, color: Colors.black),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       controller: controller.searchController,
//                       decoration: const InputDecoration(
//                         hintText: 'Find plant',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//              CustomTextfieldStack(),
//             const SizedBox(height: 10),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                       backgroundColor: kPrimaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("All",
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                       backgroundColor: kPrimaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("Plants",
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                       backgroundColor: kPrimaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("Pots",
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                       backgroundColor: kPrimaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("Seeds",
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             BlocBuilder<ProductCubit, ProductState>(
//               builder: (context, state) {
//                 if (state.status == ProductStateStatus.loading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state.status == ProductStateStatus.error) {
//                   return const Center(child: Text('Failed to load products'));
//                 } else if (state.status == ProductStateStatus.sucess) {
//                   return GridView.builder(
//                     padding: const EdgeInsets.all(10),
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.8,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: state.productsModel!.length,
//                     itemBuilder: (context, index) {
//                       final product = state.productsModel![index];
//                       return Stack(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.shade300,
//                                   blurRadius: 5,
//                                 )
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.network(
//                                   product.image,
//                                   height: 105.h(),
//                                   fit: BoxFit.contain,
//                                   errorBuilder: (context, error, stackTrace) =>
//                                       Icon(Icons.image_not_supported,
//                                           size: 50.s()),
//                                 ),
//                                 Divider(color: Colors.grey.shade300),
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(10.s()),
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           product.name,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Text(
//                                           '\$${product.price!}',
//                                           style: const TextStyle(
//                                             color: Colors.green,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   onTap: () => controller.navigateToProductDetail(product),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Positioned(
//                             top: 8,
//                             left: 8,
//                             child: Icon(Icons.shopping_cart, color: Colors.grey),
//                           ),
//                           Positioned(
//                             top: 8,
//                             right: 8,
//                             child: BlocBuilder<WishlistCubit, WishlistState>(
//                               builder: (context, wishlistState) {
//                                 final wishlistCubit = context.read<WishlistCubit>();
//                                 final isInWishlist = wishlistCubit
//                                     .wishlistItems
//                                     .any((item) => item.id == product.id);
//
//                                 return FavouriteButton(
//                                   product,
//                                   isInWishlist,
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//                 return const Center(child: Text('No products available.'));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }