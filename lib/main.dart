import 'dart:io';
import 'product.dart';

void main() {

  bool running = true;

  while (running) {

    print("\n===== PRODUCT MANAGEMENT =====");

    print("1. Show all products");
    print("2. Add product");
    print("3. Delete product");
    print("4. Update product");
    print("5. Search product");
    print("6. Sort price ASC");
    print("7. Sort price DESC");
    print("0. Exit");

    stdout.write("Choose option: ");

    int choice = int.tryParse(
        stdin.readLineSync() ?? ""
    ) ?? -1;

    switch (choice) {

    // Show all
      case 1:

        Product.showAll();
        break;

    // Add
      case 2:

        stdout.write("Enter ID: ");
        int id = int.parse(
            stdin.readLineSync()!
        );

        stdout.write("Enter Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter Image: ");
        String image = stdin.readLineSync()!;

        stdout.write("Enter Price: ");
        double price = double.parse(
            stdin.readLineSync()!
        );

        Product.addProduct(

          Product(
            id: id,
            name: name,
            image: image,
            price: price,
          ),
        );

        break;

    // Delete
      case 3:

        stdout.write("Enter ID delete: ");

        int deleteId = int.parse(
            stdin.readLineSync()!
        );

        Product.deleteProduct(deleteId);

        break;

    // Update
      case 4:

        stdout.write("Enter ID update: ");

        int updateId = int.parse(
            stdin.readLineSync()!
        );

        stdout.write("Enter new name: ");

        String newName = stdin.readLineSync()!;

        stdout.write("Enter new price: ");

        double newPrice = double.parse(
            stdin.readLineSync()!
        );

        Product.updateProduct(
          updateId,
          newName,
          newPrice,
        );

        break;

    // Search
      case 5:

        stdout.write("Enter keyword: ");

        String keyword = stdin.readLineSync()!;

        var result = Product.searchByName(keyword);

        if (result.isEmpty) {

          print("Cannot found");

        } else {

          for (var p in result) {

            print(
                "${p.name} - ${p.price}"
            );
          }
        }

        break;

    // Sort ASC
      case 6:

        var asc = Product.sortByPriceAsc();

        for (var p in asc) {

          print(
              "${p.name} - ${p.price}"
          );
        }

        break;

    // Sort DESC
      case 7:

        var desc = Product.sortByPriceDesc();

        for (var p in desc) {

          print(
              "${p.name} - ${p.price}"
          );
        }

        break;

    // Exit
      case 0:

        print("Exit program");

        running = false;
        break;

      default:

        print("Invalid option");
    }
  }
}