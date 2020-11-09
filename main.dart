import 'package:flutter/foundation.dart';

/// Product Model
class Product {
  String id;
  String name;
  int price;
  int stock;
  Product({this.name, this.price, this.id, this.stock});
}

/// Dummy Data
class Repo {
  static List<Product> data = [
    Product(id: '1', name: 'Biskuit', price: 6000, stock: 10),
    Product(id: '2', name: 'Chips', price: 8000, stock: 0),
    Product(id: '3', name: 'Oreo', price: 10000, stock: 7),
    Product(id: '4', name: 'Tango', price: 12000, stock: 12),
    Product(id: '5', name: 'Cokelat', price: 15000, stock: 0),
  ];
}

/// Machine Class
class Machine {
  List<Product> products;
  List<int> _validMoney = [2000, 5000, 20000, 50000];

  /// Get Product Lists
  void getProducts() => products = Repo.data;

  /// Show Product Lists
  void showProducts() {
    products.forEach((f) {
      print('(${f.id}) ${f.name} = Rp ${f.price} | Stok ${f.stock}');
    });
  }

  /// Buy Product
  void buyProduct({@required String id, @required int qty, @required int money}) {
    final prod = products.where((p) => p.id == id).toList().first;
    final totalPrice = prod.price * qty;
    print('');
    print('-- Pembelian --');
    print('${prod.name} Rp ${prod.price} x $qty = Rp $totalPrice');
    print('Uang Rp $money');
    print('');
    if (prod.stock > 0) {
      if (money > prod.price) {
        if (_validMoney.contains(money)) {
          print('Pembelian Berhasil!');
          print('Kembalian Rp ${money - totalPrice}');
        } else {
          print('Pembelian Gagal!');
          print('Hanya terima Rp 2000 / 5000 / 20000 / 50000');
        }
      } else {
        print('Pembelian Gagal!');
        print('Uang tidak cukup!');
      }
    } else {
      print('Pembelian Gagal!');
      print('${prod.name} habis!');
    }
  }
}

void main() {
  final machine = new Machine();

  machine.getProducts();
  machine.showProducts();

  // Uncomment to buy product
  // @required ID ,QTY , MONEY
  // machine.buyProduct(id: '5', qty: 1, money: 10000);
}
