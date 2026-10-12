import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
          Text('Your cart is empty', style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Add items to start shopping', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
