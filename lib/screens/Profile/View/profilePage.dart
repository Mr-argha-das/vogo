import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/screens/SplashScreen/View/Splesh_Screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('userdata');
    final id = box.get('@id');
    final name = box.get('name');
    final email = box.get('email');
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (context, child) => Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          
                          
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${name}",
                                  style: GoogleFonts.abel(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                  size: 16.sp,
                                ),
                              ],
                            ),
                            Text(
                              "$email",
                              style: GoogleFonts.abel(
                                fontSize: 13.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  ...[
                    _buildTile(Icons.shopping_bag_outlined, "Orders"),
                    _buildTile(Icons.perm_identity, "My Details"),
                    _buildTile(Icons.location_on_outlined, "Delivery Address"),
                    _buildTile(Icons.credit_card_outlined, "Payment Methods"),
                    _buildTile(Icons.confirmation_num_outlined, "Promo Cord"),
                    _buildTile(Icons.notifications_none, "Notifications"),
                    _buildTile(Icons.help_outline, "Help"),
                    _buildTile(Icons.info_outline, "About"),
                  ],
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: TextButton.icon(
                        onPressed: () async {
                          // Log out logic here
                          Fluttertoast.showToast(
                            msg: "Logged out successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                          await box.clear();
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SplashScreen1(),
                            ),
                            (route) => false,
                          );
                        },
                        icon: Icon(Icons.logout, color: Colors.green),
                        label: Text(
                          "Log Out",
                          style: GoogleFonts.abel(
                            color: Colors.green,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: GoogleFonts.abel(fontSize: 15.sp, color: Colors.black87),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
          onTap: () {},
        ),
        Divider(thickness: 1, color: Colors.grey.shade200),
      ],
    );
  }
}

Widget _bottomBarItem(IconData icon, String label, {bool isActive = false}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: isActive ? Colors.green : Colors.black, size: 24.sp),
      Text(
        label,
        style: GoogleFonts.abel(
          fontSize: 12.sp,
          color: isActive ? Colors.green : Colors.black,
        ),
      ),
    ],
  );
}
