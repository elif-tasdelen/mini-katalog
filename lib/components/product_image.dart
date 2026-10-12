import 'package:flutter/material.dart';

// Görsel internetten geliyorsa Image.network, yoksa Image.asset kullanılır
class ProductImage extends StatelessWidget {
  final String path;
  final double? height;
  final BoxFit fit;

  const ProductImage({
    super.key,
    required this.path,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('http')) {
      return Image.network(
        path,
        height: height,
        width: double.infinity,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(24),
      child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
    );
  }
}
