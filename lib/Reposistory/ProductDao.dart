import 'package:exam/Entity/Product.dart';

class ProductDAO {

  List<Product> l;

  // Constructor
  ProductDAO(this.l);

  // Get all product
  void getAllProduct() {

    l = Product.products;
  }

  // Show all product
  void showAll() {

    if (l.isEmpty) {

      print("Product list is empty");
      return;
    }

    for (var p in l) {

      print(p);
    }
  }

  // Add product
  void addProduct(Product p) {

    var index = l.indexWhere(
          (element) => element.id == p.id,
    );

    if (index < 0) {

      l.add(p);

      print("Add successfully");

    } else {

      print("Product ID already exists");
    }
  }

  // Delete product
  void deleteProduct(String id) {

    l.removeWhere(
          (element) => element.id == id,
    );

    print("Delete successfully");
  }

  // Update product
  void updateProduct(Product pNew) {

    var index = l.indexWhere(
          (element) => element.id == pNew.id,
    );

    if (index >= 0) {

      l[index] = pNew;

      print("Update successfully");

    } else {

      print("Cannot found product");
    }
  }

  // Search by name
  List<Product> searchByName(String keyword) {

    return l.where(
          (p) => p.name
          .toLowerCase()
          .contains(keyword.toLowerCase()),
    ).toList();
  }

  // Search by price
  List<Product> searchByPrice(double minPrice) {

    return l.where(
          (p) => p.price >= minPrice,
    ).toList();
  }

  // Find by ID
  Product? findProduct(String id) {

    try {

      return l.firstWhere(
            (p) => p.id == id,
      );

    } catch (e) {

      return null;
    }
  }

  // Increase price 10% using map
  void increasePrice() {

    l = l.map(
          (p) => p.copyWith(
        price: p.price * 1.1,
      ),
    ).toList();

    print("Increase price 10% successfully");
  }

  // Sort ASC
  List<Product> sortPriceAsc() {

    List<Product> result = [...l];

    result.sort(
          (a, b) => a.price.compareTo(b.price),
    );

    return result;
  }

  // Sort DESC
  List<Product> sortPriceDesc() {

    List<Product> result = [...l];

    result.sort(
          (a, b) => b.price.compareTo(a.price),
    );

    return result;
  }
}