// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/profile/profile_cubit.dart';
// import 'package:graduate_project/screens/wishlist/wishlist_cubit.dart';
//
// import '../product_detail_screen.dart';
//
// class ShopController extends GetxController {
//   final WishlistCubit wishlistCubit = WishlistCubit();
//   final ProductCubit productCubit = ProductCubit();
//   final ProfileCubit profileCubit = ProfileCubit();
//
//   final searchController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     wishlistCubit.loadWishlist();
//     productCubit.getProducts();
//   }
//
//   @override
//   void onClose() {
//     searchController.dispose();
//     super.onClose();
//   }
//
//   void navigateToSettings() {
//     Get.toNamed('SettingScreen');
//   }
//
//   void navigateToProfile() {
//     Get.toNamed('ProfileScreen');
//   }
//
//   void navigateToProductDetail(product) {
//     Get.to(() => ProductDetailScreen(product: product));
//   }
// }