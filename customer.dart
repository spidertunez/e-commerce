import 'order.dart';

class Customer {
  String? name;
  int id;
  String email;
  String address;
  Order? order;

  Customer(this.name, this.id, this.email, this.address, {this.order});

  @override
  String toString() {
    return 'Customer(name: $name, id: $id, email: $email, address: $address, order: ${order?.toString() ?? "No order"})';
  }
}
