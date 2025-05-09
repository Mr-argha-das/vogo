import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Sprite Can",
      "description": "325ml, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 11.png",
      "price": 1.50
    },
    {
      "name": "Diet Coke",
      "description": "355ml, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 11.png",
      "price": 1.99
    },
    {
      "name": "Apple & Grape Juice",
      "description": "2L, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 13.png",
      "price": 15.50
    },
    {
      "name": "Coca Cola Can",
      "description": "325ml, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 14.png",
      "price": 4.99
    },
    {
      "name": "Pepsi Can",
      "description": "330ml, Price",
      "image": "assets/Images/FavouritePageImage/juice.png",
      "price": 4.99
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Favourite",
            style: GoogleFonts.abel(color: Colors.black, fontSize: 20.sp),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) =>
                    Divider(color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            width: 60.w,
                            height: 60.w,
                            color: Colors.grey.shade100,
                            child: Image.asset(
                              item["image"],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"],
                                style: GoogleFonts.abel(fontSize: 16.sp),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                item["description"],
                                style: GoogleFonts.abel(
                                    fontSize: 13.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "\$${item["price"].toStringAsFixed(2)}",
                              style: GoogleFonts.abel(fontSize: 15.sp),
                            ),
                            SizedBox(height: 6.h),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.sp, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    // Add all items to cart
                  },
                  child: Text(
                    "Add All To Cart",
                    style:
                        GoogleFonts.abel(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
