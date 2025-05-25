// search_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/network/http.api.service.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/addTocart.model.dart';

import 'package:vogo/data/models/pruduts.byCategorymodel.dart' as model;
import 'package:vogo/screens/Filter/View/FilterPage.dart';
import 'package:vogo/screens/MyCart/view/MyCartpage.dart';
import 'package:vogo/screens/productDetails/view/ProductDetailsPage.dart';

class SearchPage extends ConsumerStatefulWidget {
  final String categoryName;
  final int categoryId;
  const SearchPage({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productsProvider(widget.categoryId).notifier).clearData();
      ref.read(productsProvider(widget.categoryId).notifier).loadInitial();
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      ref.read(productsProvider(widget.categoryId).notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider(widget.categoryId));
    final notifier = ref.read(productsProvider(widget.categoryId).notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Results for: ${widget.categoryName}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        decoration: const InputDecoration(
                          hintText: "Search products...",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          notifier.updateSearchQuery(value);
                        },
                      ),
                    ),
                    if (_searchController.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _searchFocusNode.unfocus();
                          notifier.updateSearchQuery('');
                        },
                      ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const FilterScreen(),
                          ),
                        );
                      },
                      child: const Icon(Icons.tune, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    notifier.loadInitial();
                  },
                  child:
                      products.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.builder(
                            controller: _scrollController,
                            itemCount: products.length + 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 16,
                                ),
                            itemBuilder: (context, index) {
                              if (index >= products.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final product = products[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder:
                                          (context) => ProductDetailScreen(
                                            productId: product.id.toString(),
                                          ),
                                    ),
                                  );
                                },
                                child: ProductCard(product: product),
                              );
                            },
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final model.ProductsByCategoryModel product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool cartisLoding = false;
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // child: Center(
            //   child:
            //       product.images!.isNotEmpty
            //           ? Image.network(
            //             product.images?.first.src ?? "",
            //             fit: BoxFit.contain,
            //             errorBuilder: (context, error, stack) {
            //               return const Icon(
            //                 Icons.image_not_supported,
            //                 color: Colors.grey,
            //               );
            //             },
            //           )
            //           : const Icon(
            //             Icons.image_not_supported,
            //             color: Colors.grey,
            //           ),
            // ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                    product.images?.first.src ?? "",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name ?? "No name",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (product.weight != null && product.weight!.isNotEmpty)
            Text(
              product.weight!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${product.price} lei",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
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
                      productId: product.id.toString(),
                      quantity: 1,
                    ),
                  );
                  Fluttertoast.showToast(
                    msg: "${response.response.data["message"]}",
                    textColor: Colors.white,
                    backgroundColor: Color(0xFF0D5C3E),

                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                  );
                  if(response.response.data['status'] != false){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => CartScreen()));
                  }
                  // setState(() {
                  //   cartisLoding = false;
                  // });
                  // if (response
                  //         .response
                  //         .statusCode ==
                  //     200) {

                  // } else {
                  //   Fluttertoast.showToast(
                  //     msg: "Failed to add product to cart",
                  //     textColor: Colors.white,
                  //     backgroundColor: Colors.red,

                  //     toastLength:
                  //         Toast.LENGTH_LONG,
                  //     gravity: ToastGravity.TOP,
                  //   );

                  // }
                  setState(() {
                    cartisLoding = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(6),
                  child:
                      cartisLoding == false
                          ? Icon(Icons.add, color: Colors.white, size: 20)
                          : CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
