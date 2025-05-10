import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/data/providers/products.provider.dart';
import 'package:vogo/screens/Search/View/SearchPage.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productService = ref.watch(productProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: productService.when(
        data: (snapshot) {
          // Filter the list based on search query
          final filteredCategories =
              snapshot.where((category) {
                final name =
                    category.catalogVisibility?.name?.toLowerCase() ?? '';
                return name.contains(_searchQuery.toLowerCase());
              }).toList();

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Find premium services and products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 3,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child:
                        filteredCategories.isEmpty
                            ? const Center(
                              child: Text(
                                "No results found",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                            : GridView.builder(
                              itemCount: filteredCategories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.9,
                                  ),
                              itemBuilder: (context, index) {
                                final category = filteredCategories[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder:
                                            (context) => Search_Page(
                                              categoryName: category.name ?? "",
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: generateSoftColor(),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: generateSoftColor().withOpacity(
                                          0.5,
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  category.images![0].src ??
                                                      "https://placehold.co/600x400/000000/FFFFFF/png",
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          category.name ??
                                              "No name",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
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
          );
        },
        error: (err, stack) {
          return Center(
            child: Text(
              'Error: $err',
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        },
      ),
    );
  }
}

// Generates a soft pastel-like color for grid tiles
Color generateSoftColor() {
  final List<Color> softColors = [
    Colors.green.shade50,
    Colors.orange.shade50,
    Colors.pink.shade50,
    Colors.purple.shade50,
    Colors.yellow.shade50,
    Colors.blue.shade50,
  ];

  final Random random = Random();
  return softColors[random.nextInt(softColors.length)];
}
