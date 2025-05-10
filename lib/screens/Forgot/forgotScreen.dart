import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/forgotBodyModel.dart';
import 'package:vogo/data/providers/forgot.provider.dart';

class ForgotScreen extends ConsumerStatefulWidget {
  const ForgotScreen({super.key});

  @override
  ConsumerState<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends ConsumerState<ForgotScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  bool _bottonLoder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: Image.asset('assets/Images/vogo doar v verde 1.png'),
                ),
                SizedBox(height: 30.h),

                Text(
                  'Conectare la VOGO',
                  style: GoogleFonts.abel(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Enter your emails',
                  style: GoogleFonts.abel(fontSize: 16.sp, color: Colors.grey),
                ),
                SizedBox(height: 36.h),

                // Email Field
                Text(
                  'Email',
                  style: GoogleFonts.abel(fontSize: 16.sp, color: Colors.grey),
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

                // Name Field
                SizedBox(height: 40.h),

                // Log In Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          _bottonLoder == false) {
                        setState(() {
                          _bottonLoder = true;
                        });
                        try {
                          final res = await ref.read(
                            forgotprovider(
                              ForgotbodyModel(email: emailController.text),
                            ).future,
                          );

                          Fluttertoast.showToast(
                            msg: "${res.message}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                          log(res.message);
                        } catch (e) {
                          Fluttertoast.showToast(
                            msg: "Error: $e",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                          log("Error: $e");
                        } finally {
                          setState(() {
                            _bottonLoder = false;
                          });
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter your email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 12.0,
                        );
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
                              'Update',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
