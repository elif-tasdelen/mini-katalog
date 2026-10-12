import 'package:flutter/material.dart';

import '../components/product_card.dart';
import '../models/product_model.dart';
import '../models/route_args.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  final Set<int> cartIds = {};

  List<Product> allProducts = [];
  String searchText = '';
  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadProducts() async {
    setState(() {
      isLoading = true;
    });
    try {
      final products = await apiService.fetchProducts();
      setState(() {
        allProducts = products;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Ürünler yüklenirken bir hata oluştu.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  // Arama kutusuna yazılan metne göre ürünleri filtreler
  List<Product> get filteredProducts {
    if (searchText.isEmpty) return allProducts;
    return allProducts
        .where((p) => p.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  void openCart() {
    Navigator.pushNamed(
      context,
      '/cart',
      arguments: CartArgs(allProducts: allProducts, cartIds: cartIds),
    ).then((_) => setState(() {}));
  }

  void openDetail(Product product) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: DetailArgs(product: product, cartIds: cartIds),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  IconButton(
                    onPressed: openCart,
                    iconSize: 30,
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              const Text(
                'Find your perfect device.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search products',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  ApiService.bannerUrl,
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage.isNotEmpty
                        ? Center(child: Text(errorMessage))
                        : products.isEmpty
                            ? const Center(child: Text('Ürün bulunamadı'))
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.7,
                                ),
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return ProductCard(
                                    product: product,
                                    onTap: () => openDetail(product),
                                  );
                                },
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
