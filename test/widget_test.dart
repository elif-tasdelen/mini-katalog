import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog/models/product_model.dart';

void main() {
  test('Product.fromJson alanları doğru okur', () {
    final product = Product.fromJson({
      'id': 1,
      'name': 'iPhone 15 Pro',
      'tagline': 'Titanyum',
      'description': 'Test ürünü',
      'price': '\$999',
      'currency': 'USD',
      'image': 'assets/images/logo.png',
      'specs': {'color': 'Siyah'},
    });

    expect(product.id, 1);
    expect(product.name, 'iPhone 15 Pro');
    expect(product.price, '\$999');
    expect(product.specs['color'], 'Siyah');
  });
}
