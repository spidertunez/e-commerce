class Product {
  int id;
  String productName;
  double price;
  int stockqun;
  String description;

  Product(
      this.id, this.productName, this.price, this.stockqun, this.description);

  void updateStock(int quantity) {
    stockqun += quantity;
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $productName, price: $price, stock: $stockqun, description: $description)';
  }
}
