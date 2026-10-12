import 'product_model.dart';

// Sayfalar arası taşınan veriler (Route Arguments)
class DetailArgs {
  final Product product;
  final Set<int> cartIds;

  DetailArgs({required this.product, required this.cartIds});
}

class CartArgs {
  final List<Product> allProducts;
  final Set<int> cartIds;

  CartArgs({required this.allProducts, required this.cartIds});
}
