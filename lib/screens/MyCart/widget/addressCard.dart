import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogo/data/models/addressList.model.dart';

class AddressCard extends StatelessWidget {
  final AdressData address;
  final String label;
  final VoidCallback onTap;

  const AddressCard({
    super.key,
    required this.address,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            SizedBox(height: 4),
            Text(
              "${address.firstName} ${address.lastName}, ${address.address1}, ${address.address2}, ${address.city}, ${address.stateName} - ${address.postcode}, ${address.countryName}",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            SizedBox(height: 4),
            Text("Phone: ${address.phone}", style: TextStyle(fontSize: 13)),
            Text("Email: ${address.email}", style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
