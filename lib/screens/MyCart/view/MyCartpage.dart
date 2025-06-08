import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/addressList.model.dart';
import 'package:vogo/data/models/checkout.model.dart';
import 'package:vogo/data/providers/address.provider.dart';
import 'package:vogo/data/providers/cartList.provider.dart';
import 'package:vogo/data/models/cartsList.model.dart';
import 'package:vogo/data/models/remove.cart.model.dart';
import 'package:vogo/data/models/update.cartmodel.dart';
import 'package:vogo/screens/Explore/view/ExplorePage.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart';
import 'package:vogo/screens/MyCart/view/emptyCart.page.dart';
import 'package:vogo/screens/MyCart/widget/address.shett.dart';
import 'package:vogo/screens/billingadress/billingadress.dart';
import 'package:vogo/screens/orders/orderDetails.page.dart';
import 'package:vogo/screens/productDetails/view/ProductDetailsPage.dart';

class CartItem {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: "Bell Pepper Red",
      description: "1kg, Price",
      imageUrl: "assets/Images/cartImages/banana.png",
      price: 4.99,
    ),
    CartItem(
      name: "Egg Chicken Red",
      description: "4pcs, Price",
      imageUrl: "assets/Images/cartImages/Group 6858.png",
      price: 1.99,
    ),
    CartItem(
      name: "Organic Bananas",
      description: "12kg, Price",
      imageUrl: "assets/Images/cartImages/pngfuel 3.png",
      price: 3.00,
    ),
    CartItem(
      name: "Ginger",
      description: "250gm, Price",
      imageUrl: "assets/Images/cartImages/pngfuel 16.png",
      price: 2.99,
    ),
  ];

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      setState(() {
        cartItems[index].quantity--;
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  @override
  void initState() {
    super.initState();

    Future.microtask(() => ref.invalidate(cartListProvider));
  }

  bool btnLoder = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = ref.watch(cartListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: GoogleFonts.abel(fontSize: 22.sp)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: cartProvider.when(
        data: (snapshot) {
          double cartTotal = 0;
          if (snapshot.data.isNotEmpty) {
            for (var item in snapshot.data) {
              cartTotal +=
                  int.parse(item.price.split('.')[0]) *
                  item.productCartQuantity;
            }
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(16.w),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailScreen(
                                  productId: item.productId.toString(),
                                ),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.w,
                            height: 100.h,

                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: NetworkImage(item.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    truncateString(item.title, maxLength: 12),
                                    style: GoogleFonts.abel(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    item.price,
                                    style: GoogleFonts.abel(
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      _quantityButton(Icons.remove, () {
                                        setState(() {
                                          if (item.productCartQuantity > 1) {
                                            item.productCartQuantity =
                                                item.productCartQuantity - 1;
                                          }
                                        });
                                        setState(() async {
                                          final box = await Hive.openBox(
                                            'userdata',
                                          );
                                          final userId = box.get('@id');
                                          if (item.productCartQuantity > 1) {
                                            final service = APIStateNetwork(
                                              await createDio(),
                                            );
                                            final response = await service
                                                .updateCart(
                                                  UpdateCartModel(
                                                    accessToken: "${userId}",
                                                    productId:
                                                        "${item.productId}",
                                                    cartKey: "${item.cartKey}",
                                                    quantity:
                                                        item.productCartQuantity,
                                                  ),
                                                );
                                            if (response
                                                    .response
                                                    .data["status"] ==
                                                true) {
                                              ref.refresh(cartListProvider);
                                            }
                                          }
                                        });
                                      }),
                                      SizedBox(width: 10.w),
                                      Text(
                                        '${item.productCartQuantity}',
                                        style: GoogleFonts.abel(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      _quantityButton(Icons.add, () {
                                        setState(() {
                                          item.productCartQuantity =
                                              item.productCartQuantity + 1;
                                        });
                                        setState(() async {
                                          final box = await Hive.openBox(
                                            'userdata',
                                          );
                                          final userId = box.get('@id');
                                          final service = APIStateNetwork(
                                            await createDio(),
                                          );
                                          final response = await service
                                              .updateCart(
                                                UpdateCartModel(
                                                  accessToken: "${userId}",
                                                  productId:
                                                      "${item.productId}",
                                                  cartKey: "${item.cartKey}",
                                                  quantity:
                                                      item.productCartQuantity,
                                                ),
                                              );
                                          if (response
                                                  .response
                                                  .data["status"] ==
                                              true) {
                                            ref.refresh(cartListProvider);
                                          }
                                        });
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                onPressed: () async {
                                  Datum? data;
                                  setState(() {
                                    data = item;
                                    snapshot.data.removeAt(index);
                                  });
                                  Fluttertoast.showToast(
                                    msg: "Cart Remove succesfully",
                                    textColor: Colors.white,
                                    backgroundColor: Color(0xFF0D5C3E),

                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.TOP,
                                  );
                                  final box = await Hive.openBox('userdata');
                                  final id = box.get('@id');
                                  final service = APIStateNetwork(
                                    await createDio(),
                                  );
                                  final response = await service.removecartItem(
                                    RemoveCartModel(
                                      accessToken: "$id",
                                      productId: "${data!.productId}",
                                      cartKey: "${data!.cartKey}",
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "${(int.parse(item.price.split('.')[0]) * item.productCartQuantity)}",
                                style: GoogleFonts.abel(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      btnLoder = true;
                    });
                    final service = APIStateNetwork(await createDio());

                    final box = await Hive.openBox('userdata');
                    final id = box.get('@id');
                    final response = service.getAddress(id);
                    response.then((data) {
                      bool exists = data.response.data["status"];
                      if (exists == false) {
                        setState(() {
                          btnLoder = false;
                        });
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => BillingFormScreen(),
                          ),
                        );
                      } else {
                        final model = AddressListModel.fromJson(
                          data.response.data,
                        );
                        setState(() {
                          btnLoder = false;
                        });
                        showAddressBottomSheet(context, model.data, () async {
                          final box = await Hive.openBox("userdata");
                          final userid = box.get("@id");
                          final name = box.get('name');
                          final email = box.get('email');
                          showCheckoutSheet(
                            context,
                            snapshot.cartTotal,
                            email,
                            snapshot.shippingTotal,
                            () async {
                              final service = APIStateNetwork(
                                await createDio(),
                              );
                              final response = await service.emptyCart(userid);
                            },
                          );
                        });
                      }
                    });
                  },
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child:
                        btnLoder == true
                            ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Go to Checkout",
                                      style: GoogleFonts.abel(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        72,
                                        158,
                                        103,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Text(
                                      "${cartTotal}",
                                      style: GoogleFonts.abel(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stack) {
          return EmptyCartPage(
            title: "Ready to order?",
            subtitle:
                "When you add products from a store,\nyour carts will appear here.",
            image: 'assets/11518398.jpg',
          );
        },
        loading: () {
          return Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.green.shade700, rightDotColor: Colors.blue, size: 40));
        },
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 20.sp,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

void showCheckoutSheet(
  BuildContext context,
  String totalAmount,
  String name,
  String deliveryCharge,
  Function callBack,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      bool isLoading = false;
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Checkout",
                            style: GoogleFonts.abel(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Delivery
                      checkoutRow(
                        "Delivery charge",
                        "$deliveryCharge lei",
                        showArrow: false,
                      ),

                      // Payment
                      // checkoutRow(
                      //   "Payment",
                      //   "",
                      //   trailing: Image.asset(
                      //     'assets/Images/cartImages/card.png',
                      //     height: 24,
                      //     width: 40,
                      //   ),
                      // ),

                      // Promo
                      // checkoutRow("Promo Code", "Pick discount"),

                      // Total
                      checkoutRow(
                        "Total Cost",
                        "$totalAmount lei",
                        showArrow: false,
                      ),

                      const SizedBox(height: 20),

                      // Terms and buttons
                      Text.rich(
                        TextSpan(
                          text: "By placing an order you agree to our ",
                          style: GoogleFonts.abel(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: "Terms And Conditions\n",
                              style: GoogleFonts.abel(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: "Home     "),
                            TextSpan(
                              text: "vogo.famly@gmail.com",
                              style: GoogleFonts.abel(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Place Order
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              final box = await Hive.openBox("userdata");
                              final userid = box.get("@id");

                              final service = APIStateNetwork(
                                await createDio(),
                              );
                              final response = await service.checkOut(
                                ChekOutBody(
                                  accessToken: userid,
                                  paymentType: "cod",
                                ),
                              );

                              setState(() {
                                isLoading = false;
                              });

                              if (response.response.data["code"] == 200) {
                                callBack();
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => OrderAcceptedScreen(orderid: '${response.response.data["data"]["order_id"]}',),
                                  ),
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Oops! Order Failed",
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                );
                              }
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                msg: "Something went wrong!",
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            }
                          },
                          child:
                              isLoading == true
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  )
                                  : Text(
                                    "Place Order",
                                    style: GoogleFonts.abel(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}

Widget checkoutRow(
  String title,
  String value, {
  Widget? trailing,
  bool showArrow = true,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.abel(fontSize: 16)),
        Row(
          children: [
            trailing ??
                Text(
                  value,
                  style: GoogleFonts.abel(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            if (showArrow) const Icon(Icons.chevron_right),
          ],
        ),
      ],
    ),
  );
}

class OrderAcceptedScreen extends StatelessWidget {
  final String orderid;
  const OrderAcceptedScreen({super.key, required this.orderid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Soft background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Checkmark Image with Confetti
              Image.asset(
                'assets/Images/cartImages/Group 6872.png',
                width: 200,
                height: 200,
              ),

              const SizedBox(height: 30),

              // ✅ Main Title
              Text(
                "Your Order has been accepted",
                textAlign: TextAlign.center,
                style: GoogleFonts.abel(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 10),

              // ✅ Subtitle
              Text(
                "Your items has been placd and is on\nit's way to being processed",
                textAlign: TextAlign.center,
                style: GoogleFonts.abel(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              // ✅ Track Order Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // navigate to track order
                    Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => DeliveryDetailsPage(orderId: orderid.toString(),),
                    ),
                  );
                  },
                  child: Text(
                    "Order Details",
                    style: GoogleFonts.abel(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ✅ Back to Home Text
              GestureDetector(
                onTap: () {
                  // navigate to home
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => BottomNavBar()),
                  );
                },
                child: Text(
                  "Back to home",
                  style: GoogleFonts.abel(fontSize: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
