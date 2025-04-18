import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduate_project/screens/shop_screen.dart';

import '../cart/cart_screen.dart';
import '../community_screen.dart';
import '../scanner_screen.dart';
import '../wishlist/wish_list_screen.dart';


class MainScreenController extends GetxController {
  @override
  void onInit() {

    super.onInit();
  }


  int currentTab = 0;

  List<Widget> get tabs {
    return [
      ShopScreen(),
      CartScreen(),
      // ScannerScreen(), // Added Scanner Page
      WishListScreen(),
      CommunityScreen(),
    ];
  }

  changeTab({required int index,int? companyIndex}) {
    currentTab = index;
    update();
  }

  // Future<void> fetchLoggedInUser() async {
  //   try {
  //     final result = await userRepository.getLoggedInUserAccount();
  //     result.fold(
  //           (failure) {
  //         // Handle failure
  //       },
  //           (data) {
  //         print(data);
  //       },
  //     );
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

}