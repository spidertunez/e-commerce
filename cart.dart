import 'product.dart';

class Cart {
  final Map<Product, int> _items = {};

  void addProduct(Product product, int quantity) {
    if (product.stockqun < quantity) {
      print('Not enough quantity in stock for product: ${product.productName}');
    }

    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + quantity;
    } else {
      _items[product] = quantity;
    }

    product.updateStock(-quantity);
  }

  void removeProduct(Product product) {
    product.updateStock(_items[product]!);
    _items.remove(product);
  }

  double getTotal() {
    double total = 0;

    for (var entry in _items.entries) {
      total += entry.key.price * entry.value;
    }
    return total;
  }

  @override
  String toString() {
    return _items.entries
        .map((entry) =>
            '${entry.key.productName}: ${entry.value} x \$${entry.key.price}')
        .join(', ');
  }
}
