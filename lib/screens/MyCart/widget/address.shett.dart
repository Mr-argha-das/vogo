import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vogo/data/models/addressList.model.dart';
import 'package:vogo/screens/MyCart/widget/addressCard.dart';

void showAddressBottomSheet(
  BuildContext context,
  List<AdressData> addresses,
  Function callBack,
) {
  final billing = addresses.firstWhere((a) => a.type == 'billing');
  final shipping = addresses.firstWhere((a) => a.type == 'shipping');

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
    ),
    builder: (context) {
      return Container(
        height: 500.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Choose Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),

                SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: addresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (addresses[index].type == "billing") {
                      return Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        child: AddressCard(
                          address: addresses[index],
                          label: "Billing Address",
                          onTap: () {
                            callBack();
                            Navigator.pop(context);
                          },
                        ),
                      );
                    } else {
                      return AddressCard(
                        address: addresses[index],
                        label: "Shipping Address",
                        onTap: () {
                          callBack();
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
