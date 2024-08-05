import 'order.dart';

class Customer {
  String? name;
  int id;
  String email;
  String address;
  int? phone;
  Order? order;

  Customer(this.name, this.id, this.email, this.address, this.phone);
  @override
  String toString() {
    return 'Customer(name: $name, id: $id, email: $email, address: $address, order: ${order?.toString() ?? "No order"})';
  }
}
