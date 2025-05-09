import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart' show BottomNavBar;
import 'package:vogo/screens/Singin/view/SinginPage.dart';


class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String? selectedZone = 'Banasree';
  String? selectedArea;

  final List<String> zones = ['Banasree', 'Uttara', 'Dhanmondi'];
  final List<String> areas = ['Block A', 'Block B', 'Block C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Icon(Icons.arrow_back, size: 28.sp),
              SizedBox(height: 100.h),
              Center(
                child: Image.asset(
                  'assets/Images/illustration.png', // Replace with your asset
                  height: 120.h,
                ),
              ),
              SizedBox(height: 32.h),
              Center(
                child: Text(
                  'Select Your Location',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  'Switch on your location to stay in tune with\nwhat’s happening in your area',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),

              // Zone Dropdown
              Text(
                'Your Zone',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 6.h),
              DropdownButtonFormField<String>(
                value: selectedZone,
                items: zones
                    .map((zone) => DropdownMenuItem(
                          value: zone,
                          child: Text(zone),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => selectedZone = value),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 24.h),

              // Area Dropdown
              Text(
                'Your Area',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 6.h),
              DropdownButtonFormField<String>(
                hint: const Text("Types of your area"),
                value: selectedArea,
                items: areas
                    .map((area) => DropdownMenuItem(
                          value: area,
                          child: Text(area),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => selectedArea = value),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              const Spacer(),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginScreen()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D5C3E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: GestureDetector(
                    onTap:() {
                     Navigator.push(context, CupertinoPageRoute(builder: (context)=>BottomNavBar()),);
                  } ,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
