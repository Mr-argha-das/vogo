import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vogo/screens/Singin/view/SelectLocation.dart';


class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 👈 prevents UI from resizing on keyboard
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, size: 28.sp),
              SizedBox(height: 32.h),
              Text(
                'Enter your 4-digit code',
                style: GoogleFonts.abel(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Code',
                style: GoogleFonts.abel(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                  counterText: "", // Hide counter
                  hintText: "- - - -",
                  hintStyle: GoogleFonts.abel(letterSpacing: 16.sp),
                  contentPadding: EdgeInsets.only(bottom: 8.h),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                style: TextStyle(
                  fontSize: 24.sp,
                  letterSpacing: 16.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Resend Code',
                style: GoogleFonts.abel(
                  fontSize: 16.sp,
                  color: const Color(0xFF3DBA6D),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=>SelectLocationScreen()),);
                          },
                  child: Container(
                    height: 60.w,
                    width: 60.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3DBA6D),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
