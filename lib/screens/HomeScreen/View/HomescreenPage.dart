import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vogo/data/providers/categorys.provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final categoryResponse = ref.watch(categorsysProvider);

    return categoryResponse.when(
      data: (snapshot) {
        // 🔍 Filter categories by search query
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
                            : GridView.builder(
                              itemCount: filteredList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.85,
                                    crossAxisSpacing: 12.w,
                                    mainAxisSpacing: 12.h,
                                  ),
                              itemBuilder: (context, index) {
                                final item = filteredList[index];
                                return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.network(
                                        item.image?.src ??
                                            "https://placehold.co/600x400/000000/FFFFFF/png",
                                        height: 100.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      item.name ?? "No name",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.abel(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green[900],
                                      ),
                                    ),
                                  ],
                                );
                              },
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
      error: (err, stack) {
        return Center(
          child: Text(
            'Error: $err',
            style: GoogleFonts.abel(fontSize: 16.sp, color: Colors.red),
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(color: Colors.green[800]),
        );
      },
    );
  }
}
