import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduate_project/utils/app_responsive.dart';
import 'dart:async';
import '../../constants.dart';
import '../cart/cart_controller.dart';
import '../scanner_screen.dart';
import 'main_screen_controller.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "MainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenController controller = Get.put(MainScreenController());
  // final CartController cartController = Get.put(CartController());

  // Variables for handling double back swipe to exit
  bool _isBackPressed = false;
  Timer? _backPressTimer;

  @override
  void dispose() {
    _backPressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GetBuilder<MainScreenController>(
        builder: (controller) {
          return PopScope(
            canPop: _isBackPressed,
            onPopInvoked: (didPop) {
              if (didPop) {
                // The pop was allowed, app will exit
                return;
              }

              // First back press
              setState(() {
                _isBackPressed = true;
              });

              // Reset the back press state after 2 seconds
              _backPressTimer = Timer(Duration(seconds: 2), () {
                setState(() {
                  _isBackPressed = false;
                });
              });
            },
            child: Scaffold(
              body: Container(
                color: Colors.white,
                child: controller.tabs[controller.currentTab],
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  controller.changeTab(index:index);
                },
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentTab >= controller.tabs.length ? 0 : controller.currentTab,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.green,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "home".tr,
                    icon: Icon(Icons.home,size: 18.s(),),
                    activeIcon: Icon(Icons.home_filled,size: 18.s(),),
                  ),
                  BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 3),
                          child: Icon(Icons.shopping_cart,size: 18.s(),),
                        ),
                        Obx(() {
                          final cartItemCount = Get.find<CartController>().cartItems.length;
                          return cartItemCount > 0
                              ? Positioned(
                            top: -5,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16.w(),
                                minHeight: 16.h(),
                              ),
                              child: Text(
                                '$cartItemCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.s(),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                              : SizedBox.shrink();
                        }),
                      ],
                    ),
                    label: 'cart'.tr,
                  ),

                  BottomNavigationBarItem(

                    backgroundColor: Colors.white,
                    label: "Products".tr,
                    icon: Icon(FontAwesomeIcons.solidHeart,size: 18.s(),),
                    activeIcon: Icon(FontAwesomeIcons.solidHeart,size: 18.s(),),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "Community".tr,
                    icon: Icon(Icons.group,size: 18.s(),),
                    activeIcon: Icon(Icons.group_outlined,size: 18.s(),),
                  ),


                ],              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ScannerScreen())),
                backgroundColor: kPrimaryColor,
                elevation: 6,
                shape: const CircleBorder(),
                child: Image.asset(
                  'assets/images/Scanner.png',
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            ),
          );
        },
      ),
    );
  }
}