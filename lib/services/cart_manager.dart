import 'package:_9_store_app/models/product_model.dart';

class CartManager {
  static List<ProductModel> cartItems = [];

  static Map<ProductModel, int> quantities = {};

  static Map<ProductModel, bool> checkedItems = {};

  static void addToCart(ProductModel product) {
    cartItems.add(product);
    quantities[product] = 1;
    checkedItems[product] = false;
  }

  static void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    quantities.remove(product);
    checkedItems.remove(product);
  }

  static void updateQuantity(ProductModel product, int newQuantity) {
    if (quantities.containsKey(product)) {
      quantities[product] = newQuantity;
    }
  }

  static void updateChecked(ProductModel product, bool isChecked) {
    if (checkedItems.containsKey(product)) {
      checkedItems[product] = isChecked;
    }
  }

  static double getTotalPrice() {
    double total = 0;
    for (var product in cartItems) {
      if (checkedItems[product] == true) {
        int quantity = quantities[product] ?? 1;
        total += (product.price * quantity);
      }
    }
    return total;
  }

  static void clearCart() {
    cartItems.clear();
    quantities.clear();
    checkedItems.clear();
  }
}
