
import 'package:get/get.dart';
import '../../models/disply_product.dart';
import 'cart_screen.dart';

class CartController extends GetxController {
  // Observable list to track cart items with quantities
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  // Normal variables for subtotal and total
  final RxDouble subtotal = 0.0.obs;
  final RxDouble total = 0.0.obs;



  @override
  void onInit() {
    super.onInit();
    // Set up a listener to recalculate totals when cart changes
    ever(cartItems, (_) => _calculateTotals());
  }

  // Calculate both subtotal and total
  void _calculateTotals() {
    double newSubtotal = 0.0;

    for (var item in cartItems) {
      try {
        // Convert price string to double and multiply by quantity
        double price = double.parse(item.product.price);
        newSubtotal += price * item.quantity;
      } catch (e) {
        print('Error parsing price: ${e.toString()}');
        // Continue with next item if there's a parsing error
      }
    }

    subtotal.value = newSubtotal;
    // Currently total equals subtotal, but you could add tax, shipping, etc.
    total.value = newSubtotal;
  }

  // Add item to cart or increment quantity if already exists
  void addToCart(CartItem product) {
    final existingIndex = cartItems.indexWhere(
          (item) => item.product.id == product.product.id,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex] = cartItems[existingIndex].copyWith(
        quantity: product.quantity,
      );
    } else {
      cartItems.add(CartItem(product: product.product, quantity: product.quantity));
    }

    // No need to call _calculateTotals() here as the 'ever' listener will handle it
  }

  // Remove item from cart completely
  void removeFromCart(ProductDM product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    // No need to call _calculateTotals() here as the 'ever' listener will handle it
  }

  // Update quantity of specific item
  void updateQuantity(ProductDM product, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(product);
      return;
    }

    final existingIndex = cartItems.indexWhere(
          (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex] = cartItems[existingIndex].copyWith(
        quantity: newQuantity,
      );
    }

    // No need to call _calculateTotals() here as the 'ever' listener will handle it
  }

  // Get current quantity of product in cart
  int getQuantity(ProductDM product) {
    final existingIndex = cartItems.indexWhere(
          (item) => item.product.id == product.id,
    );
    return existingIndex != -1 ? cartItems[existingIndex].quantity : 0;
  }

  // Get total number of unique items in cart
  int get uniqueItemsCount => cartItems.length;

  // Clear cart
  void clearCart() {
    cartItems.clear();
    // No need to call _calculateTotals() here as the 'ever' listener will handle it
  }
}
