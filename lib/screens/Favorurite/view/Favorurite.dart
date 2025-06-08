import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/addwishlist.model.dart';

import 'package:vogo/data/providers/wishlistProvider.dart';
import 'package:vogo/screens/MyCart/view/emptyCart.page.dart';
import 'package:vogo/screens/productDetails/view/ProductDetailsPage.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Sprite Can",
      "description": "325ml, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 11.png",
      "price": 1.50,
    },
    {
      "name": "Diet Coke",
      "description": "355ml, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 11.png",
      "price": 1.99,
    },
    {
      "name": "Apple & Grape Juice",
      "description": "2L, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 13.png",
      "price": 15.50,
    },
    {
      "name": "Coca Cola ≠Can",
      "description": "325ml, Price",
      "image": "assets/Images/FavouritePageImage/pngfuel 14.png",
      "price": 4.99,
    },
    {
      "name": "Pepsi Can",
      "description": "330ml, Price",
      "image": "assets/Images/FavouritePageImage/juice.png",
      "price": 4.99,
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask(() => ref.invalidate(wishlistProvider));
  }

  bool btnLoder = false;
  @override
  Widget build(BuildContext context) {
    final wishlistData = ref.watch(wishlistProvider);

    return wishlistData.when(
      data: (snapshot) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder:
              (_, __) => Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Favourite",
                    style: GoogleFonts.abel(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: snapshot.data.length,
                        separatorBuilder:
                            (_, __) => Divider(color: Colors.grey.shade300),
                        itemBuilder: (context, index) {
                          final item = snapshot.data[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ProductDetailScreen(
                                        productId: item.productId,
                                      ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Container(
                                      width: 60.w,
                                      height: 60.w,
                                      color: Colors.grey.shade100,
                                      child: Image.network(
                                        item.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              truncateString(
                                                item.title,
                                                maxLength: 20,
                                              ),
                                              style: GoogleFonts.abel(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              item.currencySymbol +
                                                  " " +
                                                  item.regularPrice,
                                              style: GoogleFonts.abel(
                                                fontSize: 14.sp,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "${item.price} lei",
                                        style: GoogleFonts.abel(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      GestureDetector(
                                        onTap: () async {
                                          final box = Hive.box("userdata");
                                          final userid = box.get("@id");
                                          final productID = item.productId;
                                          final service = APIStateNetwork(
                                            await createDio(),
                                          );
                                          setState(() {
                                            snapshot.data.removeAt(index);
                                          });
                                          final response = await service
                                              .removeWishListItem(
                                                AddWishListBody(
                                                  accessToken: '$userid',
                                                  productId: productID,
                                                ),
                                              );
                                          Fluttertoast.showToast(
                                            msg: "Product remove from wishlist",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 12.0,
                                          );
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 16.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 20.w,
                    //     vertical: 12.h,
                    //   ),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     height: 56.h,
                    //     child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Colors.green,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(16.r),
                    //         ),
                    //       ),
                    //       onPressed: () async {
                    //         // Add all items to cart
                    //         if (btnLoder == false) {
                    //           setState(() {

                    //             btnLoder = true;
                    //           });
                    //           final service = APIStateNetwork(
                    //             await createDio(),
                    //           );
                    //           // Simulate adding items to cart
                    //           final box = await Hive.openBox('userdata');
                    //           final userId = box.get('@id');
                    //           for (var item in snapshot.data) {
                    //             await service.addToCart(
                    //               AddTOcartModel(
                    //                 productId: item.productId,
                    //                 quantity: 1,
                    //                 accessToken: userId,
                    //               ),
                    //             );
                    //           }
                    //           setState(() {
                    //             btnLoder = false;
                    //           });
                    //           Fluttertoast.showToast(msg: "All items added to cart", backgroundColor: Colors.green);
                    //         } else {}
                    //       },
                    //       child: btnLoder == false? Text(
                    //         "Add All To Cart",
                    //         style: GoogleFonts.abel(
                    //           fontSize: 18.sp,
                    //           color: Colors.white,
                    //         ),
                    //       ): CircularProgressIndicator(
                    //         color: Colors.white,
                    //         strokeWidth: 1.5,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
        );
      },
      error: (err, stack) {
        return EmptyCartPage(
          title: "Ready to wishlist?",
          subtitle:
              "When you add products from a store,\nyour wishlist will appear here.",
          image: 'assets/4418995.jpg',
        );
      },
      loading: () {
        return Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.green.shade700, rightDotColor: Colors.blue, size: 40));
      },
    );
  }
}

String truncateString(String value, {int maxLength = 13}) {
  return (value.length <= maxLength)
      ? value
      : '${value.substring(0, maxLength)}...';
}
