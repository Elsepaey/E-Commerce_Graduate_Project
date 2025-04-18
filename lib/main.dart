// import 'package:flutter/material.dart';
// import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/changeyour_password_screen.dart';
// import 'package:graduate_project/screens/contact_us_screen.dart';
// import 'package:graduate_project/screens/forgot_yourpassword.dart';
// import 'package:graduate_project/screens/who_are_us_screen.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';
// import 'package:graduate_project/screens/profile_screen.dart';
// import 'package:graduate_project/screens/setting_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/login_page.dart';
// import 'package:graduate_project/screens/signup_screen.dart';
// import 'package:graduate_project/screens/splash_screen.dart';
// import 'package:graduate_project/screens/start_screen.dart';
// import 'package:graduate_project/screens/update_information.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample product to pass for ProductDetailScreen demo.
//     final sampleProduct = ProductModel(
//       id: 1, // Add the id argument here
//       image: 'https://via.placeholder.com/150',
//       name: 'Sample Plant',
//       price: 29.99,
//       description: 'This is a sample description for the plant.',
//       category: 'Plants', // Add the category argument here
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'SplashScreen': (context) => SplashScreen(),
//         'StartScreen': (context) => StartScreen(),
//         'LoginPage': (context) => LoginPage(),
//         'SignupScreen': (context) => SignupScreen(),
//         'ShopScreen': (context) => ShopScreen(),
//         'SettingScreen': (context) => SettingScreen(),
//         'ProfileScreen': (context) => ProfileScreen(),
//         'ProductDetailScreen': (context) =>
//             ProductDetailScreen(product: sampleProduct),
//         'WishListScreen': (context) => WishListScreen(),
//         'ForgotYourpassword': (context) => ForgotYourpassword(),
//         'ChangeyourPasswordScreen': (context) => ChangeyourPasswordScreen(),
//         'UpdateInformation': (context) => UpdateInformation(),
//         'ContactUsScreen': (context) => ContactUsScreen(),
//         'WhoAreUsScreen': (context) => WhoAreUsScreen(),
//         'CartScreen': (context) => CartScreen(),
//       },
//       initialRoute: 'SplashScreen',
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/product/product_cubit.dart';
// import 'package:graduate_project/cubits/profile/profile_cubit.dart';
// import 'package:graduate_project/model/product_model.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';
// import 'package:graduate_project/screens/cart_screen.dart';
// import 'package:graduate_project/screens/changeyour_password_screen.dart';
// import 'package:graduate_project/screens/contact_us_screen.dart';
// import 'package:graduate_project/screens/forgot_yourpassword.dart';
// import 'package:graduate_project/screens/reset_password.dart';
// import 'package:graduate_project/screens/verify_code.dart';
// import 'package:graduate_project/screens/who_are_us_screen.dart';
// import 'package:graduate_project/screens/product_detail_screen.dart';
// import 'package:graduate_project/screens/profile_screen.dart';
// import 'package:graduate_project/screens/setting_screen.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/login_page.dart';
// import 'package:graduate_project/screens/signup_screen.dart';
// import 'package:graduate_project/screens/splash_screen.dart';
// import 'package:graduate_project/screens/start_screen.dart';
// import 'package:graduate_project/screens/update_information.dart';
// import 'package:graduate_project/screens/wish_list_screen.dart';
// import 'package:graduate_project/services/services_locator.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   await CacheHelper.init();
//   ServicesLocator.setup();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample product to pass for ProductDetailScreen demo.
//     final sampleProduct = ProductModel(
//       slug: 1, // Add the id argument here
//       image: 'https://via.placeholder.com/150',
//       name: 'Sample Plant',
//       price: 29.99,
//       description: 'This is a sample description for the plant.',
//       category: 'Plants', // Add the category argument here
//     );

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ProfileCubit>(
//           create: (context) => ServicesLocator.profileCubit,
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         routes: {
//           '/': (context) => SplashScreen(),
//           'StartScreen': (context) => StartScreen(),
//           'LoginPage': (context) => LoginPage(),
//           'SignupScreen': (context) => SignupScreen(),
//           'ShopScreen': (context) => ShopScreen(),
//           'SettingScreen': (context) => SettingScreen(),
//           'ProfileScreen': (context) => ProfileScreen(),
//           'ProductDetailScreen': (context) =>
//               ProductDetailScreen(product: sampleProduct),
//           'WishListScreen': (context) => WishListScreen(),
//           'ForgotYourpassword': (context) => ForgotYourpassword(),
//           'ChangeyourPasswordScreen': (context) => ChangeyourPasswordScreen(),
//           'UpdateInformation': (context) => UpdateInformation(),
//           'ContactUsScreen': (context) => ContactUsScreen(),
//           'WhoAreUsScreen': (context) =>WhoAreUsScreen(),
//           'CartScreen': (context) => CartScreen(),
//           'VerifyCode': (context) => VerifyCode(),
//           'ResetPassword': (context) => ResetPassword(),
//         },
//         initialRoute: 'SplashScreen',
//       ),
//     );
//   }
// }

//after

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduate_project/cubits/profile/profile_cubit.dart';
import 'package:graduate_project/models/disply_product.dart'; // Corrected import
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/screens/cart/cart_screen.dart';
import 'package:graduate_project/screens/changeyour_password_screen.dart';
import 'package:graduate_project/screens/contact_us_screen.dart';
import 'package:graduate_project/screens/forgot_yourpassword.dart';
import 'package:graduate_project/screens/login_page.dart';
import 'package:graduate_project/screens/mainScreen/main_screen_view.dart';
import 'package:graduate_project/screens/product_detail_screen.dart';
import 'package:graduate_project/screens/profile_screen.dart';
import 'package:graduate_project/screens/reset_password.dart';
import 'package:graduate_project/screens/setting_screen.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/screens/splash_screen.dart';
import 'package:graduate_project/screens/start_screen.dart';
import 'package:graduate_project/screens/update_information.dart';
import 'package:graduate_project/screens/verify_code.dart';
import 'package:graduate_project/screens/who_are_us_screen.dart';
import 'package:graduate_project/screens/wishlist/wish_list_screen.dart';
import 'package:graduate_project/screens/wishlist/wishlist_cubit.dart';
import 'package:graduate_project/services/services_locator.dart';
import 'package:graduate_project/utils/app_responsive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CacheHelper.init();
  ServicesLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.context = context;

    final sampleProduct = ProductDM(
      id: "1",
      image: 'https://via.placeholder.com/150',
      name: 'Sample Plant',
      price: '29.99', // Price is stored as a string in DisplyProduct
      description: 'This is a sample description for the plant.',
      category: 'Plants',
      rating: 3.0,
      slug: 'Hamo_beka',
      careGuide:
          'Best for plants with colorful flowers to create an eye-catching contrast. Water regularly and ensure good soil aeration.',
      quantity: 8, createdAt: '2025-02-26T21:56:23.308977Z',
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) => ServicesLocator.profileCubit,
        ),
        BlocProvider(create: (context) => WishlistCubit()..loadWishlist()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          'StartScreen': (context) => StartScreen(),
          'LoginPage': (context) => LoginPage(),
          'SignupScreen': (context) => SignupScreen(),
          'MainScreen':(context)=>MainScreen(),
          'ShopScreen': (context) => ShopScreen(),
          'SettingScreen': (context) => SettingScreen(),
          'ProfileScreen': (context) => ProfileScreen(),
          'WishListScreen': (context) => WishListScreen(),
          'ForgotYourpassword': (context) => ForgotYourpassword(),
          'ChangeyourPasswordScreen': (context) => ChangeyourPasswordScreen(),
          'UpdateInformation': (context) => UpdateInformation(),
          'ContactUsScreen': (context) => ContactUsScreen(),
          'WhoAreUsScreen': (context) => WhoAreUsScreen(),
          'CartScreen': (context) => CartScreen(),
          'VerifyCode': (context) => VerifyCode(),
          'ResetPassword': (context) => ResetPassword(),
        },
        //   initialRoute: 'SplashScreen',
        initialRoute: '/',
      ),
    );
  }
}

//cart
