import 'package:flutter/foundation.dart';
import '../models/card_item.dart';

class CardProvider with ChangeNotifier {
  final List<CardItem> _items = [];

  List<CardItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.fold(0, (sum, item) => sum + item.total);

  double get shipping => _items.isEmpty ? 0 : 4.99;

  double get total => subtotal + shipping;

  void addItem(CardItem item) {
    final existingIndex = _items.indexWhere((i) =>
    i.id == item.id && i.size == item.size && i.color == item.color);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void updateQuantity(int index, int change) {
    if (index >= 0 && index < _items.length) {
      _items[index].quantity += change;
      if (_items[index].quantity <= 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}