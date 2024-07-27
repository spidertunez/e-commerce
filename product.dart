class Product {
  late int id ;
  late String productName;
  late double price ;
  late int stockqun;

Product(this.id,this.price, this.productName, this.stockqun);

void updatestock(int quantity) {
    stockqun += quantity;
  }

@override
  String toString() {
    return 'Product(id: $id, name: $productName, price: $price, stock: $stockqun)';
  }

}