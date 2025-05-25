import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vogo/data/providers/categorys.provider.dart';
import 'package:vogo/screens/Search/View/SearchPage.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String truncateString(String value, {int maxLength = 13}) {
    return (value.length <= maxLength)
        ? value
        : '${value.substring(0, maxLength)}...';
  }

  @override
  Widget build(BuildContext context) {
    final categoryResponse = ref.watch(categoryListProvider);
    final categoryNotifier = ref.read(categoryListProvider.notifier);

    return categoryResponse.when(
      data: (snapshot) {
        final filteredList =
            snapshot.where((item) {
              final name = item.name?.toLowerCase() ?? '';
              return name.contains(searchQuery.toLowerCase());
            }).toList();

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey[600]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            style: GoogleFonts.abel(fontSize: 16),
                            decoration: InputDecoration(
                              hintText:
                                  'How can I help you today - multiple languages like website',
                              hintStyle: GoogleFonts.abel(
                                color: Colors.grey[600],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          "Categories",
                          style: GoogleFonts.abel(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Tot ce conteaza pentru tine. ',
                              style: GoogleFonts.openSans(fontSize: 18.sp),
                              children: [
                                TextSpan(
                                  text: 'Servicii \nPremium verificate',
                                  style: GoogleFonts.openSans(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' - Vezi ',
                                  style: GoogleFonts.openSans(fontSize: 18.sp),
                                ),
                                TextSpan(
                                  text: 'aici',
                                  style: GoogleFonts.openSans(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        filteredList.isEmpty
                            ? const Padding(
                              padding: EdgeInsets.only(top: 24),
                              child: Center(
                                child: Text(
                                  "No results found",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                            : NotificationListener<ScrollNotification>(
                              onNotification: (scrollInfo) {
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
                                    filteredList.length +
                                    (categoryNotifier.hasMore ? 1 : 0),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 12.w,
                                      mainAxisSpacing: 12.h,
                                    ),
                                itemBuilder: (context, index) {
                                  if (index < filteredList.length) {
                                    final item = filteredList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        // Handle item tap
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder:
                                                (context) => SearchPage(
                                                  categoryName:
                                                      item.name ?? "",
                                                  categoryId: item.id ?? 0,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      item.image ??
                                                          "https://placehold.co/600x400/000000/FFFFFF/png",
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 6.h),
                                            Text(
                                              truncateString(
                                                item.name ?? "No name",
                                              ),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.abel(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.green[900],
                                              ),
                                            ),
                                            SizedBox(height: 3.h),
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error:
          (err, stack) => Center(
            child: Text(
              'Error: $err',
              style: GoogleFonts.abel(fontSize: 16.sp, color: Colors.red),
            ),
          ),
      loading:
          () => Center(
            child: CircularProgressIndicator(color: Colors.green[800]),
          ),
    );
  }
}
