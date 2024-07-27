import 'customer.dart';
import 'product.dart';

class Order {
  String order_id;
  Customer customer;
  Product product;
  String status;
  int quantity;

 
  Order(this.order_id, this.customer, this.product, this.status, this.quantity);

  
  double calculateTotal() {
    return product.price * quantity;
  }

  void processOrder() {
    if (product.stockqun < quantity) {
      print('Not enough stock available for product: ${product.productName}');
    }
   
    product.updatestock(-quantity);

    status = 'Completed';
  }

  @override
  String toString() {
    return 'Order(id: $order_id, customer: ${customer.name}, product: ${product.productName}, quantity: $quantity, status: $status, total: \$${calculateTotal()})';
  }
}
