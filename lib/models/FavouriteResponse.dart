// Define a WishlistResponse model if you need it for other endpoints
import 'disply_product.dart';

class WishlistResponse {
  bool? success;
  num? code;
  String? message;
  List<ProductDM>? data;

  WishlistResponse({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  WishlistResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDM.fromJson(v));
      });
    }
  }
}

// Function to directly parse wishlist array response to products
List<ProductDM> parseWishlistToProducts(List<dynamic> wishlistItems) {
  List<ProductDM> products = [];
  for (var item in wishlistItems) {
    if (item is Map<String, dynamic> && item.containsKey('product')) {
      products.add(ProductDM.fromJson(item['product']));
    }
  }
  return products;
}
