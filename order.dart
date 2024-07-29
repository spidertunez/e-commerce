import 'customer.dart';
import 'product.dart';

class Order {
  String orderId;
  Customer customer;
  List<Product> products;
  String status;
  int quantity;

  DateTime orderTime;

  Order(this.orderId, this.customer, this.products, this.status, this.orderTime,
      this.quantity);

  double calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price * quantity;
    }
    return total;
  }

  void processOrder() {
    for (var product in products) {
      if (product.stockqun < quantity) {
        print('Not enough stock available for product: ${product.productName}');
        return;
      }
    }

    for (var product in products) {
      product.updateStock(-product.stockqun);
    }

    status = 'Completed';
  }

  @override
  String toString() {
    return 'Order(id: $orderId, customer: ${customer.name}, products: ${products.map((p) => p.productName).join(', ')}, status: $status, total: \$${calculateTotal()}, orderTime: $orderTime)';
  }
}
