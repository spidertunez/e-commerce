import 'order.dart';

class Payment {
  late int paymentId;
  late Order order;
  late double amount;
  late String paymentMethod;
  late String status;
  late DateTime timestamp;

  Payment(
    this.paymentId,
    this.order,
    this.amount,
    this.paymentMethod,
    this.status,
    this.timestamp,
  );

  void processPayment() {
    print(
        'Processing payment of \$${amount} for Order ID ${order.orderId} using $paymentMethod...');
    status = 'Completed';
    print('Payment completed successfully.');
  }

  void updateStatus(String newStatus) {
    status = newStatus;
    print('Payment status updated to $status.');
  }

  String getPaymentDetails() {
    return '''
      Payment ID: $paymentId
      Order ID: ${order.orderId}
      Amount: \$${amount}
      Payment Method: $paymentMethod
      Status: $status
      Timestamp: ${timestamp.toIso8601String()}
    ''';
  }

  @override
  String toString() {
    return getPaymentDetails();
  }
}
