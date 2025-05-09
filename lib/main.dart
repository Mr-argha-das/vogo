import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vogo/core/utils/globalroute.key.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart';
import 'package:vogo/screens/SplashScreen/View/Splesh_Screen.dart';
// import 'package:mobile-main/Explore/view/ExplorePage.dart' show ExploreScreen;
// import 'package:mobile-main/Filter/View/FilterPage.dart' show FilterScreen;
// import 'package:vogo/HomeScreen/View/HomescreenPage.dart';
// import 'package:vogo/HomeScreen/View/bottombar.dart' show BottomNavBar;
// import 'package:vogo/Search/View/SearchPage.dart' show SearchResultsScreen;
// import 'package:vogo/Singin/view/Bynumber.dart';
// import 'package:vogo/Singin/view/Digitalcode.dart';
// import 'package:vogo/Singin/view/SelectLocation.dart';
// import 'package:vogo/Singin/view/Register.dart' show SignInScreen;
// import 'package:vogo/Singin/view/SinginPage.dart';
// import 'package:vogo/SplashScreen/View/Splesh_Screen.dart';
// import 'package:vogo/productDetails/view/ProductDetailsPage.dart' show ProductDetailScreen;
// import 'package:mobile-main/Singin/view/NumberInput.dart';

void main() async {
  try {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
  } catch (e) {
    log("Hive initialization failed: $e");
  }
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          key: navigatorKey,
          home:
              // BottomNavBar()
              // ProductDetailScreen()
              // FilterScreen()
              // SearchResultsScreen()
              // ExploreScreen()
              // HomeScreen()
              // LoginScreen()
              // SelectLocationScreen()
              // OtpVerificationScreen()
              // // NumberInputScreen()
              SplashScreen1(),

          // const SplashScreen(),
          routes: {'/home': (context) => const BottomNavBar()},
        );
      },
    );
  }
}
