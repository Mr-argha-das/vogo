import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/addTocart.model.dart';
import 'package:vogo/data/models/addwishlist.model.dart';
import 'package:vogo/data/providers/product.detail.provider.dart';
import 'package:vogo/screens/MyCart/view/MyCartpage.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  bool isFavorite = false;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    log('Product ID: ${widget.productId}');
  }

  bool cartisLoding = false;
  @override
  Widget build(BuildContext context) {
    final productDetail = ref.watch(productDetailProvider(widget.productId));
    return productDetail.when(
      data: (snapshot) {
        String avgRatingStr = snapshot.averageRating ?? "0.0"; // e.g., "4.3"
        double avgRating = double.tryParse(avgRatingStr) ?? 0.0;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image + Top buttons
                    Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 280,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.images != []
                                          ? snapshot.images![0].src.toString()
                                          : 'https://example.com/default_image.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Title
                    SizedBox(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  truncateString(
                                    snapshot.name.toString(),
                                    maxLength: 25,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  '1kg, Price',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                    final service = APIStateNetwork(
                                      await createDio(),
                                    );
                                    var box = await Hive.openBox('userdata');
                                    final userId = box.get('@id');
                                    if (isFavorite == true) {
                                      await service.addToWishList(
                                        AddWishListBody(
                                          accessToken: userId,
                                          productId: snapshot.id.toString(),
                                        ),
                                      );
                                      Fluttertoast.showToast(
                                        msg: "Added to Wishlist",
                                        textColor: Colors.white,
                                        backgroundColor: Colors.green,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                      );
                                    } else {
                                      await service.removeWishListItem(
                                        AddWishListBody(
                                          accessToken: userId,
                                          productId: snapshot.id.toString(),
                                        ),
                                      );
                                      Fluttertoast.showToast(
                                        msg: "Removed from Wishlist",
                                        textColor: Colors.white,
                                        backgroundColor: Colors.red,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? Colors.red : Colors.grey,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Quantity and Price
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) quantity--;
                                    });
                                  },
                                  icon: Icon(Icons.remove, color: Colors.green),
                                ),
                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: Icon(Icons.add, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${snapshot.price} lei',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Product Detail
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        tilePadding: EdgeInsets.zero,
                        title: Text(
                          'Product Detail',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20, bottom: 10),
                            child: Html(
                              data: snapshot.description.toString(),
                              onLinkTap: (url, _, __) {
                                print("Tapped link: $url");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(thickness: 1, indent: 20, endIndent: 20),

                    // Nutrition
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      title: const Text('Nutritions'),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('100gr'),
                      ),
                      onTap: () {},
                    ),

                    // Review
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      title: const Text('Review'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          double avgRating =
                              double.tryParse(
                                snapshot.averageRating ?? "0.0",
                              ) ??
                              0.0;

                          if (avgRating >= index + 1) {
                            return const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 20,
                            );
                          } else if (avgRating > index &&
                              avgRating < index + 1) {
                            return const Icon(
                              Icons.star_half,
                              color: Colors.orange,
                              size: 20,
                            );
                          } else {
                            return const Icon(
                              Icons.star_border,
                              color: Colors.orange,
                              size: 20,
                            );
                          }
                        }),
                      ),
                      onTap: () {},
                    ),

                    const SizedBox(height: 20),

                    // Add to Basket Button
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () async {
                          // Add to cart logic
                          setState(() {
                            cartisLoding = true;
                          });
                          final box = await Hive.openBox('userdata');
                          final id = box.get('@id');
                          final service = APIStateNetwork(await createDio());

                          final response = await service.addToCart(
                            AddTOcartModel(
                              accessToken: '$id',
                              productId: snapshot.id.toString(),
                              quantity: quantity,
                            ),
                          );
                          Fluttertoast.showToast(
                            msg: "${response.response.data["message"]}",
                            textColor: Colors.white,
                            backgroundColor: Color(0xFF0D5C3E),

                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                          );
                          if (response.response.data['status'] != false) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CartScreen(),
                              ),
                            );
                          }
                          setState(() {
                            cartisLoding = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.green.shade900,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child:
                                cartisLoding == false
                                    ? Text(
                                      'Add To Basket',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        letterSpacing: 0.8,
                                      ),
                                    )
                                    : CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
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
      },
      error: (err, stack) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(child: Text('Something went wrong. Please try again.')),
        );
      },
      loading:
          () => Scaffold(
            body: Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.green.shade700,
                rightDotColor: Colors.blue,
                size: 40,
              ),
            ),
          ),
    );
  }

  // Utility method
  String truncateString(String text, {int maxLength = 25}) {
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}...';
  }
}
