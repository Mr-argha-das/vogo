import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Top buttons
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Images/Vector.png'), // replace with your asset
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                     onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, size: 28)),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(Icons.share_outlined, size: 24),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Naturel Red Apple',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(
                  '1kg, Price',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
             ),
              ],
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [  IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
        size: 28,
      ),
    ),],
                ))
              ],
            ),
            const SizedBox(height: 12),

            // Quantity and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          icon: Icon(Icons.remove, color: Colors.green),
                        ),
                        Text('$quantity',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '\$4.99',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Product Detail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ExpansionTile(
                initiallyExpanded: true,
                tilePadding: EdgeInsets.zero,
                title: Text(
                  'Product Detail',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 10),
                    child: Text(
                      'Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1, indent: 20, endIndent: 20),

            // Nutrition
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              title: const Text('Nutritions'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('100gr'),
              ),
              onTap: () {},
            ),

            // Review
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              title: const Text('Review'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                ],
              ),
              onTap: () {},
            ),

            const Spacer(),

            // Add to Basket Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  // Add to cart logic
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade900,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Add To Basket',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
