import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/data/providers/categorys.provider.dart';
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
    final categoryResponse = ref.watch(categoryListProvider);
    final categoryNotifier = ref.read(categoryListProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: categoryResponse.when(
        data: (categories) {
          final filteredCategories =
              categories.where((category) {
                final name = category.name?.toLowerCase() ?? '';
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
                      style: const TextStyle(
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
                            : NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification scrollInfo) {
                                if (!categoryNotifier.isFetching &&
                                    categoryNotifier.hasMore &&
                                    scrollInfo.metrics.pixels >=
                                        scrollInfo.metrics.maxScrollExtent -
                                            300) {
                                  categoryNotifier.fetchNextPage();
                                }
                                return false;
                              },
                              child: GridView.builder(
                                itemCount:
                                    filteredCategories.length +
                                    (categoryNotifier.hasMore ? 1 : 0),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 16,
                                      childAspectRatio: 0.9,
                                    ),
                                itemBuilder: (context, index) {
                                  if (index < filteredCategories.length) {
                                    final category = filteredCategories[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder:
                                                (context) => SearchPage(
                                                  categoryName:
                                                      category.name ?? "",
                                                  categoryId: category.id ?? 0,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: generateSoftColor(),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color: generateSoftColor()
                                                .withOpacity(0.5),
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
                                                      category.image ??
                                                          "https://placehold.co/600x400/000000/FFFFFF/png",
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              truncateString(
                                                category.name ?? "No name",
                                              ),
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
                                  } else {
                                    return const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                },
                              ),
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

String truncateString(String input, {int maxLength = 15}) {
  if (input.length <= maxLength) return input;
  return '${input.substring(0, maxLength)}...';
}
