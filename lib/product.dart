class Product {

  final int id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  // Product list
  static List<Product> products = [

    Product(
      id: 101,
      name: "Laptop Dell",
      image: "dell.png",
      price: 18500,
    ),

    Product(
      id: 102,
      name: "Mouse Logitech",
      image: "mouse.png",
      price: 750,
    ),

    Product(
      id: 103,
      name: "Keyboard AKKO",
      image: "keyboard.png",
      price: 1200,
    ),
  ];

  // Show all products
  static void showAll() {

    if (products.isEmpty) {
      print("Product list is empty");
      return;
    }

    for (var p in products) {

      print(
          "ID: ${p.id} | "
              "Name: ${p.name} | "
              "Image: ${p.image} | "
              "Price: ${p.price}"
      );
    }
  }

  // Sort ASC
  static List<Product> sortByPriceAsc() {

    List<Product> result = [...products];

    result.sort(
            (a, b) => a.price.compareTo(b.price)
    );

    return result;
  }

  // Sort DESC
  static List<Product> sortByPriceDesc() {

    List<Product> result = [...products];

    result.sort(
            (a, b) => b.price.compareTo(a.price)
    );

    return result;
  }

  // Add product
  static void addProduct(Product p) {

    bool exists = products.any(
            (item) => item.id == p.id
    );

    if (exists) {

      print("ID already exists");
      return;
    }

    products.add(p);

    print("Add product successfully");
  }

  // Delete product
  static void deleteProduct(int id) {

    products.removeWhere(
            (p) => p.id == id
    );

    print("Delete successfully");
  }

  // Update product
  static void updateProduct(
      int id,
      String newName,
      double newPrice
      ) {

    int index = products.indexWhere(
            (p) => p.id == id
    );

    if (index != -1) {

      products[index] = Product(
        id: id,
        name: newName,
        image: products[index].image,
        price: newPrice,
      );

      print("Update successfully");

    } else {

      print("Cannot found product ID: $id");
    }
  }

  // Search by name
  static List<Product> searchByName(String keyword) {

    return products.where(
            (p) => p.name
            .toLowerCase()
            .contains(
            keyword.toLowerCase()
        )
    ).toList();
  }
}