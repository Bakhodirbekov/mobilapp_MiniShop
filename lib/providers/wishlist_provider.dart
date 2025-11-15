import 'package:flutter/foundation.dart';

class WishlistProvider with ChangeNotifier {
  final List<int> _wishlist = [];

  List<int> get wishlist => _wishlist;

  bool isInWishlist(int productId) {
    return _wishlist.contains(productId);
  }

  void toggleWishlist(int productId) {
    if (isInWishlist(productId)) {
      _wishlist.remove(productId);
    } else {
      _wishlist.add(productId);
    }
    notifyListeners();
  }
}