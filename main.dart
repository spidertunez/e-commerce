import 'dart:io';
import 'product.dart';
import 'cart.dart';
import 'order.dart';
import 'customer.dart';

void main() {
  Cart cart = Cart();
  List<Product> products = [
    Product(523, "Laptop", 30000, 3, "This laptop is Dell G15, Windows 11"),
    Product(367, "iPhone", 25000, 14, "iPhone 13"),
    Product(296, "Headphone", 200, 20, "Available in black only")
  ];

  while (true) {
    print('\nMenu:');
    print('1 - Add product to cart');
    print('2 - Remove product from cart');
    print('3 - View cart');
    print('4 - Checkout');
    print('5 - Exit');

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        _addProductToCart(cart, products);
        break;
      case '2':
        _removeProductFromCart(cart, products);
        break;
      case '3':
        print('Cart: $cart');
        break;
      case '4':
        _checkout(cart);
        break;
      case '5':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please enter a number between 1 and 5.');
    }
  }
}

void _addProductToCart(Cart cart, List<Product> products) {
  print('Available products:');
  for (int i = 0; i < products.length; i++) {
    print(
        '${i + 1} - ${products[i].productName} (\$${products[i].price}) - ${products[i].stockqun} in stock');
  }

  print('Enter the number of the product to add:');
  int? productIndex = int.tryParse(stdin.readLineSync() ?? '');
  if (productIndex == null ||
      productIndex < 1 ||
      productIndex > products.length) {
    print('Invalid product number.');
    return;
  }

  print('Enter the quantity:');
  int? quantity = int.tryParse(stdin.readLineSync() ?? '');
  if (quantity == null || quantity < 1) {
    print('Invalid quantity.');
    return;
  }

  cart.addProduct(products[productIndex - 1], quantity);
}

void _removeProductFromCart(Cart cart, List<Product> products) {
  if (cart.toString().isEmpty) {
    print('Cart is empty.');
    return;
  }

  print('Enter the name of the product to remove:');
  String? productName = stdin.readLineSync();

  Product? product = products.firstWhere(
    (product) => product.productName == productName,
  );

  if (product == null) {
    print('Product not found.');
    return;
  }

  cart.removeProduct(product);
}

void _checkout(Cart cart) {
  double total = cart.getTotal();
  if (total == 0) {
    print('Cart is empty. Cannot proceed to checkout.');
    return;
  }

  print('Total amount: \$${total.toStringAsFixed(2)}');
  print('Enter payment amount:');
  double? payment = double.tryParse(stdin.readLineSync() ?? '');
  if (payment == null || payment < total) {
    print('Insufficient payment.');
    return;
  }

  double change = payment - total;
  print('Payment successful. Change: \$${change.toStringAsFixed(2)}');

  String orderId = DateTime.now().millisecondsSinceEpoch.toString();
  print('Order Summary:');

  print('Date and Time: ${DateTime.now()}');
  print('Customer name:${Customer}');
  print('Cart: $cart');
  print('Total calculated: \$${total.toStringAsFixed(2)}');
  print('Payment amount: \$${payment.toStringAsFixed(2)}');
  print('Change: \$${change.toStringAsFixed(2)}');
  return;
}
