import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vogo/data/providers/orderList.provider.dart';
import 'package:vogo/screens/MyCart/view/emptyCart.page.dart';
import 'package:vogo/screens/orders/orderDetails.page.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => ref.invalidate(orderListProvider));
  }

  @override
  Widget build(BuildContext context) {
    final ordersData = ref.watch(orderListProvider);
    final orders = [
      {
        'title': 'dm drogerie markt',
        'subtitle': '1 x Dmbio Unt Clarificat Ghee Eco 180G (124534)',
        'time': 'Today',
        'slot': '10:00 - 10:30',
        'image': 'https://i.imgur.com/Bt5RJAE.png',
      },
      {
        'title': 'IQOS ILUMA, TEREA, DELIA',
        'subtitle': '5 x DELIA Classic Silver',
        'price': '116,98 RON',
        'image': 'https://i.imgur.com/fxgVGcg.png',
      },
      {
        'title': 'Carrefour Express',
        'subtitle': '5 x Vogue Lilas',
        'price': '150,99 RON',
        'image': 'https://i.imgur.com/YWr9EhT.png',
      },
      {
        'title': 'Basarabia Food',
        'subtitle': '2 x Plăcintă cu Brânză de Vaci și Verdeață...',
        'price': '210,25 RON',
        'image': 'https://i.imgur.com/NQslDC2.png',
      },
      {
        'title': 'Dei Frati',
        'subtitle':
            '2 x Supă cremă de ciuperci – Ambalaj\n1 x Tagliatelle din spanac făcute in c...',
        'price': '153,00 RON',
        'image': 'https://i.imgur.com/jB3cNnQ.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders", style: GoogleFonts.abel(fontSize: 22.sp)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ordersData.when(
        data: (snapshot) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final order = snapshot.data[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => DeliveryDetailsPage(orderId: order.orderId.toString(),),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                   
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#${order.orderId}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Total products: ${order.totalItem}, Order date: ${order.orderDate}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${order.orderTotal} lei",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                // ElevatedButton(
                                //   onPressed: () {},
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Colors.green.shade700,
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(20),
                                //     ),
                                //   ),
                                //   child: const Text(
                                //     "Reorder",
                                //     style: TextStyle(color: Colors.white),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        error: (err, stack) {
          return EmptyCartPage(title: "Ready for vogo", subtitle: "After purchasing any product it will be show here", image: "assets/image.png");
        },
        loading: () => Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.green.shade700, rightDotColor: Colors.blue, size: 40)),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
    );
  }
}
