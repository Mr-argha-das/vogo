import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:vogo/screens/Filter/View/FilterPage.dart';
import 'package:vogo/screens/productDetails/view/ProductDetailsPage.dart';


class Search_Page extends StatefulWidget {
  final String categoryName;

  const Search_Page({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Egg Chicken Red',
      'weight': '4pcs, Price',
      'price': '\$1.99',
      'image': 'assets/Images/SearchPageImages/egg-noodle (1) 2.png',
    },
    {
      'name': 'Egg Chicken White',
      'weight': '180g, Price',
      'price': '\$1.50',
      'image': 'assets/Images/SearchPageImages/egg-noodle (1) 2.png',
    },
    {
      'name': 'Egg Pasta',
      'weight': '30gm, Price',
      'price': '\$15.99',
      'image': 'assets/Images/SearchPageImages/hiclipart 2.png',
    },
    {
      'name': 'Egg Noodles',
      'weight': '2L, Price',
      'price': '\$15.99',
      'image': 'assets/Images/SearchPageImages/pngfuel 16.png',
    },
    {
      'name': 'Mayonnais Eggless',
      'weight': '',
      'price': '',
      'image': 'assets/Images/SearchPageImages/rp_24790392_0053554627_l 2.png',
    },
    {
      'name': 'Egg Noodles',
      'weight': '',
      'price': '',
      'image': 'assets/Images/SearchPageImages/pngfuel 18.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                  children:  [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Egg",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.close, color: Colors.grey),
                    SizedBox(width: 8),
                    GestureDetector(
                       onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => FilterScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.tune, color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap: () {
                         Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ProductDetailScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  item['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              item['weight'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['price'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
