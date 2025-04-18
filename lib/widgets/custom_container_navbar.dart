import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduate_project/constants.dart';

import '../screens/mainScreen/main_screen_controller.dart';

class CustomContainerNavbar extends StatelessWidget {
  final MainScreenController controller = Get.find();
  // final CartController cartController = Get.put(CartController());

  CustomContainerNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 88,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              const SizedBox(width: 1),
              _buildNavItem(Icons.shopping_cart, 'Cart', 1),
              const SizedBox(width: 20), // Spacer for the floating scanner icon
              _buildNavItem(Icons.favorite, 'Wishlist', 3),
              _buildNavItem(Icons.group, 'Community', 4),
            ],
          ),
        ),
        Positioned(
          bottom: 60,
          right: 178, // Position above the container
          child: GestureDetector(
            onTap: () => controller.changeTab(index: 2),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kWhiteColor,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/Scanner.png',
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = controller.currentTab == index;
    return GestureDetector(
      onTap: () => controller.changeTab(index: index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? kPrimaryColor : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? kPrimaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}