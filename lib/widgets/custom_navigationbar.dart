// import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//   CustomNavigationbar({super.key});

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//   int selectedIndex = 0;

//    List<Widget> pages = [
//     ShopScreen(),
//  CartScreen(),
//    WishListScreen() ,
//     CommunityScreen(),
//   ];

//    void _onItemTapped(int index) {
//      setState(() {
//        selectedIndex = index;
//      });
//    }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//    body: pages[selectedIndex],
//    bottomNavigationBar :BottomNavigationBar(

//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),

//           BottomNavigationBarItem(

//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Community',
//           ),
//         ],
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.green,
//          onTap: _onItemTapped,
//    )
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Home Screen'));
//   }
// }

// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Cart Screen'));
//   }
// }

// class WishlistScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Wishlist Screen'));
//   }
// }

// class CommunityScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Community Screen'));
// }
//}

// import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//   const CustomNavigationbar({super.key});

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     // Define the pages based on the selected index
//     Widget pages;
//     switch (selectedIndex) {
//       case 0:
//         pages = ShopScreen();
//         break;
//       case 1:
//         pages = CartScreen();
//         break;
//       case 2:
//         pages = WishListScreen();
//         break;
//       case 3:
//         pages = CommunityScreen();
//         break;
//       default:
//         pages = ShopScreen();
//     }

//     return Scaffold(
//       body: SizedBox.expand(child: pages),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (newIndex) => setState(() => selectedIndex = newIndex),
//         currentIndex: selectedIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Community',
//           ),
//         ],
//         selectedItemColor: Colors.green,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//    CustomNavigationbar({Key? key}) : super(key: key);

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     // Define the pages based on the selected index
//     Widget pages;
//     switch (selectedIndex) {
//       case 0:
//         pages =  ShopScreen();
//         break;
//       case 1:
//         pages =  CartScreen();
//         break;
//       case 2:
//         pages =  WishListScreen();
//         break;
//       case 3:
//         pages = CommunityScreen();
//         break;
//       default:
//         pages = ShopScreen();
//     }

//     return Scaffold(
//       body: pages, // Directly use pages without wrapping
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (newIndex) => setState(() => selectedIndex = newIndex),
//         currentIndex: selectedIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Community',
//           ),
//         ],
//         selectedItemColor: Colors.green,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//   CustomNavigationbar({super.key});

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//   int selectedIndex = 0;

//    List<Widget> pages = [
//     ShopScreen(),
//  CartScreen(),
//    WishListScreen() ,
//     CommunityScreen(),
//   ];

//    void _onItemTapped(int index) {
//      setState(() {
//        selectedIndex = index;
//      });
//    }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//    body: pages[selectedIndex],
//    bottomNavigationBar :BottomNavigationBar(

//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),

//           BottomNavigationBarItem(

//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Community',
//           ),
//         ],
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.green,
//          onTap: _onItemTapped,
//    )
//     );
//   }
// }

//import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//   CustomNavigationbar({super.key});

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//   int selectedIndex = 0;

//   List<Widget> tabs = [
//     ShopScreen(),
//     CartScreen(),
//     WishListScreen(),
//     CommunityScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabs[selectedIndex],
//       bottomNavigationBar: Theme(
//         data: Theme.of(context)
//             .copyWith(canvasColor: Theme.of(context).primaryColor),
//         child: BottomNavigationBar(
//           currentIndex: selectedIndex,
//           onTap: _onItemTapped, // Use the method directly
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart),
//               label: 'Cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Wishlist',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.group),
//               label: 'Community',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//   CustomNavigationbar({super.key});

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//   int selectedIndex = 0;

//   List<Widget> pages = [
//     ShopScreen(),
//     CartScreen(),
//     WishListScreen(),
//     CommunityScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//         //Scaffold(
//         //body: pages[selectedIndex],
//         //bottomNavigationBar:
//         BottomNavigationBar(
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_outlined), // Unselected icon
//           activeIcon: Icon(Icons.home), // Selected icon
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart_outlined), // Unselected icon
//           activeIcon: Icon(Icons.shopping_cart), // Selected icon
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_border), // Unselected icon
//           activeIcon: Icon(Icons.favorite), // Selected icon
//           label: 'Wishlist',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.group_outlined), // Unselected icon
//           activeIcon: Icon(Icons.group), // Selected icon
//           label: 'Community',
//         ),
//       ],
//       currentIndex: selectedIndex,
//       selectedItemColor: Colors.green, // Color for selected items
//       unselectedItemColor: Colors.grey, // Color for unselected items
//       onTap: _onItemTapped,
//     );
//     // );
//   }
// }

// // import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/community_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// class CustomNavigationbar extends StatefulWidget {
//   CustomNavigationbar({super.key});

//   @override
//   State<CustomNavigationbar> createState() => _CustomNavigationbarState();
// }

// class _CustomNavigationbarState extends State<CustomNavigationbar> {
//  int SelectedIndex =0;
//    }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//    body:  tabs[SelectedIndex],
//             bottomNavigationBar: Theme(
//                 data: Theme.of(context).copyWith(
//                   canvasColor: Theme.of(context).primaryColor
//                 ),
//               child: BottomNavigationBar(
//                 currentIndex: SelectedIndex,
//                   onTap: (index){
//                   SelectedIndex=index;
//                   setState(() {

//                   });
//                   },
//                   items: [
//                     BottomNavigationBarItem(
//                         icon: ImageIcon(AssetImage("assets/images/radio.png")
//                         ),
//                       label: 'Radio',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: ImageIcon(AssetImage("assets/images/sebha.png")
//                       ),
//                       label: 'Sebha',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: ImageIcon(AssetImage("assets/images/ahadeth.png")
//                       ),
//                       label: 'Hadeth',

//                     ),
//                     BottomNavigationBarItem(
//                       icon: ImageIcon(AssetImage("assets/images/quran.png")
//                       ),
//                       label: 'Quran',
//                     ),
//                   ]),
//             ),

//     );
//   }
//   List<Widget> tabs=[
//     ShopScreen(),
//      CartScreen(),
//      WishListScreen(),
//      CommunityScreen(),
//   ];
// import 'package:flutter/material.dart';
// class CustomNavigationbar extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<CustomNavigationbar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     // هنا يمكنك إضافة الكود لفتح الصفحة الخاصة بكل أيقونة
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Selected Index: $_selectedIndex'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.grey),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart, color: Colors.grey),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite, color: Colors.grey),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group, color: Colors.grey),
//             label: 'Community',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.green,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:graduate_project/screens/cart/cart_screen.dart';
import 'package:graduate_project/screens/community_screen.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/wishlist/wish_list_screen.dart';

class CustomNavigationbar extends StatefulWidget {
  CustomNavigationbar({super.key});

  @override
  State<CustomNavigationbar> createState() => _CustomNavigationbarState();
}

class _CustomNavigationbarState extends State<CustomNavigationbar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    ShopScreen(),
    CartScreen(),
    WishListScreen(),
    CommunityScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: pages[selectedIndex], // Display the selected page
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Community',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.green,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
