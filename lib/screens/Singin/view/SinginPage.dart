import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vogo/core/auth/login.auth.dart';
import 'package:vogo/screens/Forgot/forgotScreen.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart';
import 'package:vogo/screens/Singup/view/SingupPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool _bottonLoder = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),

                  // Decorative V logo
                  Center(
                    child: Image.asset(
                      'assets/Images/vogo doar v verde 1.png', // Replace with your asset
                      height: 250.h,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  Text(
                    'Conectare la VOGO',
                    style: GoogleFonts.abel(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Enter your emails and password',
                    style: GoogleFonts.abel(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // Email Field
                  Text(
                    'Email',
                    style: GoogleFonts.abel(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'you@example.com',
                      hintStyle: GoogleFonts.abel(color: Colors.grey.shade400),
                      border: const UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.h),

                  // Password Field
                  Text(
                    'Password',
                    style: GoogleFonts.abel(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: '********',
                      hintStyle: GoogleFonts.abel(color: Colors.grey.shade400),
                      border: const UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            () => setState(
                              () => isPasswordVisible = !isPasswordVisible,
                            ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 4) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ForgotScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.abel(
                          fontSize: 14.sp,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _bottonLoder == false) {
                          setState(() {
                            _bottonLoder = true;
                          });
                          // Simulate a network call
                          try {
                            await Auth.login(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
                          } catch (e) {
                            setState(() {
                              _bottonLoder = false;
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D5C3E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child:
                          _bottonLoder == false
                              ? Text(
                                'Log In',
                                style: GoogleFonts.abel(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              )
                              : Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Register text
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.abel(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: "Don’t have an account? "),
                            TextSpan(
                              text: "Register",
                              style: GoogleFonts.abel(
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
