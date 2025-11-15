import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../utils/colors.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../providers/wishlist_provider.dart';
import 'product_detail_screen.dart';

class CategoriesScreen extends StatefulWidget {
  final String? category;
  final String? searchQuery;

  const CategoriesScreen({
    super.key,
    this.category,
    this.searchQuery,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String _sortBy = 'default';
  List<Product> _products = [];
  String _title = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    if (widget.searchQuery != null) {
      _products = ProductsData.searchProducts(widget.searchQuery!);
      _title = 'Search Results for "${widget.searchQuery}"';
    } else if (widget.category != null) {
      _products = ProductsData.products[widget.category] ?? [];
      _title = ProductsData.categoryTitles[widget.category] ?? 'Products';
    }
    _sortProducts();
  }

  void _sortProducts() {
    setState(() {
      switch (_sortBy) {
        case 'price-low':
          _products.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'price-high':
          _products.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'name':
          _products.sort((a, b) => a.name.compareTo(b.name));
          break;
        default:
          _loadProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          _title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort, color: Colors.black),
            onSelected: (value) {
              setState(() => _sortBy = value);
              _sortProducts();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'default',
                child: Text('Default'),
              ),
              const PopupMenuItem(
                value: 'price-low',
                child: Text('Price: Low to High'),
              ),
              const PopupMenuItem(
                value: 'price-high',
                child: Text('Price: High to Low'),
              ),
              const PopupMenuItem(
                value: 'name',
                child: Text('Name'),
              ),
            ],
          ),
        ],
      ),
      body: _products.isEmpty
          ? const Center(
        child: Text(
          'No products found',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return _buildProductCard(product);
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.images[0],
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greenDark,
                            ),
                          ),
                          if (product.oldPrice != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              '\$${product.oldPrice!.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (product.discount != null)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product.discount!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greenDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Positioned(
              top: 8,
              left: 8,
              child: Consumer<WishlistProvider>(
                builder: (context, wishlist, _) {
                  final isInWishlist = wishlist.isInWishlist(product.id);
                  return GestureDetector(
                    onTap: () {
                      wishlist.toggleWishlist(product.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isInWishlist ? Icons.favorite : Icons.favorite_border,
                        color: isInWishlist ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}