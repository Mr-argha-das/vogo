import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: GoogleFonts.abel(fontSize: 22.sp)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16.w),
              itemCount: cartItems.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      item.imageUrl,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: GoogleFonts.abel(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              item.description,
                              style: GoogleFonts.abel(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                _quantityButton(
                                  Icons.remove,
                                  () => decrementQuantity(index),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '${item.quantity}',
                                  style: GoogleFonts.abel(fontSize: 16.sp),
                                ),
                                SizedBox(width: 10.w),
                                _quantityButton(
                                  Icons.add,
                                  () => incrementQuantity(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () => removeItem(index),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                          style: GoogleFonts.abel(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: GestureDetector(
              onTap: () {
                showCheckoutSheet(context);
              },
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 72, 158, 103),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
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

void showCheckoutSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
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
                  checkoutRow("Delivery", "Select Method"),

                  // Payment
                  checkoutRow(
                    "Pament",
                    "",
                    trailing: Image.asset(
                      'assets/Images/cartImages/card.png',
                      height: 24,
                      width: 40,
                    ),
                  ),

                  // Promo
                  checkoutRow("Promo Code", "Pick discount"),

                  // Total
                  checkoutRow("Total Cost", "\$13.97", showArrow: true),

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
                          text: "Profile",
                          style: GoogleFonts.abel(fontWeight: FontWeight.w500),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => OrderAcceptedScreen(),
                          ),
                        );
                      },
                      child: Text(
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
  const OrderAcceptedScreen({super.key});

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
                  },
                  child: Text(
                    "Track Order",
                    style: GoogleFonts.abel(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ✅ Back to Home Text
              GestureDetector(
                onTap: () {
                  // navigate to home
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
