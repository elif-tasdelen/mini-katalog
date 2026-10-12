import 'package:flutter/material.dart';

import '../components/product_image.dart';
import '../models/route_args.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // Route Arguments ile gelen ürün ve sepet bilgisi
    final args = ModalRoute.of(context)!.settings.arguments as DetailArgs;
    final product = args.product;

    return Scaffold(
      appBar: AppBar(title: const Text('Back')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(path: product.image, height: 350, fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.tagline,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(product.description),
                    if (product.specs.isNotEmpty) ...[
                      const Text(
                        'Specifications',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: product.specs.entries.map((e) {
                          return Chip(label: Text('${e.key}: ${e.value}'));
                        }).toList(),
                      ),
                    ],
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          args.cartIds.add(product.id);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to cart'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
