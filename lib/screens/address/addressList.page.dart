import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vogo/data/providers/address.provider.dart';
import 'package:vogo/screens/MyCart/view/emptyCart.page.dart';
import 'package:vogo/screens/billingadress/billingadress.dart';

class AddressListScreen extends ConsumerStatefulWidget {
  @override
  _AddressListScreenState createState() => _AddressListScreenState();
}

class _AddressListScreenState extends ConsumerState<AddressListScreen> {
  int selectedAddressIndex = 0;

  final List<Map<String, String>> addresses = [
    {
      'name': 'Ravi Kumar',
      'address': '123 Street, Sector 45, Gurgaon',
      'phone': '9876543210',
      'pincode': '122003',
    },
    {
      'name': 'Anita Sharma',
      'address': '56 Block A, Rohini, Delhi',
      'phone': '9988776655',
      'pincode': '110085',
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => ref.invalidate(addressProviderList));
  }

  void addAddress() {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => BillingFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final adresslist = ref.watch(addressProviderList);
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text('My Addresses', style: GoogleFonts.abel(fontSize: 22.sp)),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
      ),
      body: adresslist.when(data: (snapshot){
        return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = snapshot.data[index];
          final isSelected = selectedAddressIndex == index;

          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:  Colors.grey.shade300,
                width: isSelected ? 2.5 : 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home, color: Colors.indigo),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          address.firstName + " " + address.lastName!,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Icon(Icons.check_circle_rounded, color: Colors.green, size: 22),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("${address.address1}, ${address.address2}, ${address.city}, ${address.country}", style: TextStyle(fontSize: 15)),
                  SizedBox(height: 4),
                  Text('Pincode: ${address.postcode}', style: TextStyle(color: Colors.grey[600])),
                  Text('Phone: ${address.phone}', style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedAddressIndex = index;
                          });
                        },
                        icon: Icon(Icons.check, color: Colors.black  ,),
                        label: Text('Deliver Here', style: GoogleFonts.abel(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(Icons.edit_note_rounded, color: Colors.blueGrey),
                      //       tooltip: 'Edit Address',
                      //     ),
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(Icons.delete_forever_rounded, color: Colors.redAccent),
                      //       tooltip: 'Remove Address',
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
      }, error: (err, stack) => EmptyCartPage(
            title: "Ready to add address?",
            subtitle:
                "When you add address,\nyour all address will appear here.",
            image: 'assets/Wavy_Bus-11_Single-11.jpg',
          ), loading: ()=> Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.green.shade700, rightDotColor: Colors.blue, size: 40))) ,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addAddress,
        label: Text('Add Address', style: GoogleFonts.abel(color: Colors.white),),
        icon: Icon(Icons.add_location_alt, color: Colors.white,),
        backgroundColor: Colors.green.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}


