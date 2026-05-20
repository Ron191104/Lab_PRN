class Product {

  final String id;
  final String name;
  final String? image;
  final double price;

  // Const constructor
  const Product({
    required this.id,
    required this.name,
    this.image,
    required this.price,
  });

  // Factory constructor
  factory Product.fromJson(Map<String, dynamic> json) {

    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  // Convert object -> Json
  Map<String, dynamic> toJson() {

    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  // Copy object
  Product copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
  }) {

    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {

    return "ID: $id | "
        "Name: $name | "
        "Image: $image | "
        "Price: $price";
  }

  // Static product list
  static List<Product> products = [

    const Product(
      id: "P01",
      name: "Iphone 14",
      image: "iphone14.png",
      price: 20000,
    ),

    const Product(
      id: "P02",
      name: "Iphone 15",
      image: "iphone15.png",
      price: 30000,
    ),

    const Product(
      id: "P03",
      name: "Laptop Dell",
      image: "dell.png",
      price: 25000,
    ),

    const Product(
      id: "P04",
      name: "Mouse Logitech",
      image: "mouse.png",
      price: 1500,
    ),
  ];

  // Show all products
  static void showAll() {

    if (products.isEmpty) {

      print("Product list is empty");
      return;
    }

    for (var p in products) {

      print(p);
    }
  }

  // Add product
  static void add(Product product) {

    bool exists = products.any(
          (p) => p.id == product.id,
    );

    if (exists) {

      print("Product ID already exists");
      return;
    }

    products.add(product);

    print("Add product successfully");
  }

  // Edit product
  static void edit(Product product) {

    int index = products.indexWhere(
          (p) => p.id == product.id,
    );

    if (index != -1) {

      products[index] = product;

      print("Edit successfully");

    } else {

      print("Cannot found product");
    }
  }

  // Delete product
  static void delete(String id) {

    products.removeWhere(
          (p) => p.id == id,
    );

    print("Delete successfully");
  }

  // Search by name
  static List<Product> searchByName(String keyword) {

    return products.where(
          (p) => p.name
          .toLowerCase()
          .contains(keyword.toLowerCase()),
    ).toList();
  }

  // Search by price
  static List<Product> searchByPrice(double minPrice) {

    return products.where(
          (p) => p.price >= minPrice,
    ).toList();
  }

  // Find product by ID
  static Product? find(String id) {

    try {

      return products.firstWhere(
            (p) => p.id == id,
      );

    } catch (e) {

      return null;
    }
  }

  // Increase price 10%
  static void increasePrice() {

    products = products.map(
          (p) => p.copyWith(
        price: p.price * 1.1,
      ),
    ).toList();

    print("Increase price 10% successfully");
  }

  // Sort ASC
  static List<Product> sortPriceAsc() {

    List<Product> result = [...products];

    result.sort(
          (a, b) => a.price.compareTo(b.price),
    );

    return result;
  }

  // Sort DESC
  static List<Product> sortPriceDesc() {

    List<Product> result = [...products];

    result.sort(
          (a, b) => b.price.compareTo(a.price),
    );

    return result;
  }
}