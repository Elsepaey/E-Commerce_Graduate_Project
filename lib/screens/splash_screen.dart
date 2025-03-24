import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:graduate_project/screens/shop_screen.dart';
// import 'package:graduate_project/screens/start_screen.dart';

// import 'cache/cache_helper.dart';

// class SplashScreen extends StatefulWidget {
//   static const String routeName = '/splash';
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
// void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), () {
//     final refreshToken =    CacheHelper.getString(key: 'refreshToken');
//     if(refreshToken != ''){

//          Navigator.pushReplacement(
//              context, MaterialPageRoute(builder: (context) => ShopScreen()));
//     }else{
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => StartScreen()));
//     }

//     });
//   }

//   Widget build(BuildContext context) {
//       return Scaffold(
//         backgroundColor: Color(0xFF98CBB0),
//         body: Center(
//           child: Image.asset("assets/images/Logo.png"),
//         ),
//       );
//     }
//   }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/cubits/profile/profile_cubit.dart';
import 'package:graduate_project/cubits/profile/profile_state.dart';
import 'package:graduate_project/screens/login_page.dart';
import 'package:graduate_project/screens/shop_screen.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/screens/start_screen.dart';
import 'package:graduate_project/services/services_locator.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'cache/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ServicesLocator.profileCubit.getProfile();
      Future.delayed(const Duration(seconds: 2), () {
        checkLoginStatus();
      });
    });
  }

  Future<void> checkLoginStatus() async {
    final accessToken = CacheHelper.getString(key: 'accessToken');
    final refreshToken = CacheHelper.getString(key: 'refreshToken');

    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      Navigator.pushReplacementNamed(context, 'ShopScreen');
    } else {
      Navigator.pushReplacementNamed(context, 'StartScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF98CBB0),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/Logo.png"),
            ),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state.profileStateStatus == ProfileStateStatus.loading) {
                  showLoadingDialog(context);
                } else if (state.profileStateStatus ==
                    ProfileStateStatus.sucess) {
                  Navigator.pop(context);
                } else if (state.profileStateStatus ==
                    ProfileStateStatus.error) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, 'StartScreen');
                } else if (state.profileStateStatus ==
                    ProfileStateStatus.updateLoading) {
                  showLoadingDialog(context);
                } else if (state.profileStateStatus ==
                    ProfileStateStatus.updateSucess) {
                  Navigator.pop(context);
                  ServicesLocator.profileCubit.getProfile();
                }
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => PopScope(
      canPop: false,
      child: ModalProgressHUD(
        inAsyncCall: true,
        progressIndicator: Lottie.asset(
          'assets/animations/loading.json',
          fit: BoxFit.cover,
          width: 100,
        ),
        color: Colors.transparent,
        blur: 1,
        child: const SizedBox(),
      ),
    ),
  );
}

// void showToastt({
//   required String msg,
//   required ToastedStates state,
//   ToastGravity gravity = ToastGravity.TOP,
//   Toast toastLength = Toast.LENGTH_LONG,
// }) {
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: toastLength,
//     gravity: gravity,
//     timeInSecForIosWeb: 5,
//     backgroundColor: chooseToastColor(state),
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }

// class SplashScreen extends StatefulWidget {
//   static const String routeName = '/splash';

//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       checkLoginStatus();
//     });
//   }

//   Future<void> checkLoginStatus() async {
//     final accessToken = CacheHelper.getString(key: 'accessToken');
//     final refreshToken = CacheHelper.getString(key: 'refreshToken');

//     if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
//       Navigator.pushReplacementNamed(context, 'ShopScreen');
//     } else {
//       Navigator.pushReplacementNamed(context, 'StartScreen');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF98CBB0),
//       body: SizedBox(
//         width: MediaQuery.sizeOf(context).width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Image.asset("assets/images/Logo.png"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
