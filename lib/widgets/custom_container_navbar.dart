import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/cart_screen.dart';
import 'package:graduate_project/screens/community_screen.dart';
import 'package:graduate_project/screens/scanner_screen.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/wishlist/wish_list_screen.dart';

class CustomContainerNavbar extends StatefulWidget {
  @override
  _CustomContainerNavbarState createState() => _CustomContainerNavbarState();
}

class _CustomContainerNavbarState extends State<CustomContainerNavbar> {
  int _selectedIndex = 0;

  // List of pages corresponding to each icon
  final List<Widget> _pages = [
    ShopScreen(),
    CartScreen(),
    ScannerScreen(), // Added Scanner Page
    WishListScreen(),
    CommunityScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the selected page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              SizedBox(
                width: 1,
              ),
              _buildNavItem(Icons.shopping_cart, 'Cart', 1),
              SizedBox(width: 20), // Spacer for the floating scanner icon
              _buildNavItem(Icons.favorite, 'Wishlist', 3),
              _buildNavItem(Icons.group, 'Community', 4),
            ],
          ),
        ),
        Positioned(
          bottom: 60,
          right: 178, // Position above the container
          child: GestureDetector(
            onTap: () => _onItemTapped(2),
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
                    offset: Offset(0, 4),
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
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
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
