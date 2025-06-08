import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vogo/data/providers/orderDetails.provider.dart';
import 'package:vogo/data/providers/orderList.provider.dart';

class DeliveryDetailsPage extends ConsumerStatefulWidget {
  final String orderId;
  const DeliveryDetailsPage({super.key, required this.orderId});

  @override
  ConsumerState<DeliveryDetailsPage> createState() =>
      _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends ConsumerState<DeliveryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final orderDaetails = ref.watch(orderDetailsProvider(widget.orderId));
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Order Details",
          style: GoogleFonts.abel(fontSize: 22.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: const [
          
        ],
      ),
      body: orderDaetails.when(
        data: (snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Delivery details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 12),
                _buildDeliveryRow(
                  icon: Icons.pin_drop_outlined,
                  label: "Deliver to",
                  address:
                      "${snapshot.data.billingAddress.firstName} ${snapshot.data.billingAddress.lastName}, ${snapshot.data.billingAddress.address1}, ${snapshot.data.billingAddress.address2}, ${snapshot.data.billingAddress.city}, ${snapshot.data.billingAddress.country}, ${snapshot.data.billingAddress.postcode}",
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Summary",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildSummaryRow(
                        "Total Item",
                        snapshot.data.totalItem.toString(),
                      ),
                      _buildSummaryRow(
                        "Delivery",
                        "${snapshot.data.shippingTotal} lei",
                      ),
                      _buildSummaryRow(
                        "Subtotal",
                        "${snapshot.data.orderSubtotal} lei",
                      ),
                      _buildSummaryRow("Vat", "${snapshot.data.vat} lei"),
                      _buildSummaryRow(
                        "Total Discount",
                        "${snapshot.data.totalDiscount} lei",
                      ),

                      const Divider(thickness: 1),
                      const SizedBox(height: 4),
                      _buildSummaryRow(
                        "Estimated total",
                        "${snapshot.data.orderTotal}",
                        bold: true,
                      ),
                      const SizedBox(height: 12),
                      
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, stack) {
          return Center(child: Text("Error: $err, stack: $stack"));
        },
        loading:
            () => Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.green.shade700,
                rightDotColor: Colors.blue,
                size: 40,
              ),
            ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildDeliveryRow({
    required IconData icon,
    required String label,
    required String address,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.orange, size: 28),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
