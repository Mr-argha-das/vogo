import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart';
import 'package:vogo/screens/Singin/view/Register.dart';
import 'package:vogo/screens/Singin/view/SinginPage.dart';
import 'package:vogo/screens/Singup/view/SingupPage.dart';

// Splash Screen 1
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    final box = Hive.box('userdata');
    final id = box.get('@id');
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  id == null? SplashScreen2() : const BottomNavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D5C3E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 372.h,
              child: Image.asset(
                'assets/Images/vogo 1.png', // Add this image in assets/images
                width: 476.w,
              ),
            ),

            Text(
              'Bine ați venit!\nVOGO - cel mai mare mall\ndigital din România',
              textAlign: TextAlign.center,
              style: GoogleFonts.aDLaMDisplay(
                fontSize: 32.sp,

                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              'VOGO.family',
              style: GoogleFonts.abel(fontSize: 24.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Splash Screen 2 (Onboarding)
class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D5C3E),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height.h,
                  child: Image.asset(
                    'assets/Images/24h suport 1.png', // your image
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30.h,
                  child: Container(
                    height: 60.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D5C3E),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white30, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.abel(
                              fontSize: 24.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: 1.w,
                          height: 30.h,
                          color: Colors.white30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.abel(
                              fontSize: 24.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          Text(
            'Bine ati venit',
            style: GoogleFonts.aDLaMDisplay(
              fontSize: 48.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Obtine tot ce ai nevoie pentru tine si familia ta.\nOricand. Oriunde.',
            textAlign: TextAlign.center,
            style: GoogleFonts.aDLaMDisplay(
              fontSize: 16.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
