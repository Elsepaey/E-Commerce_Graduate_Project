import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/disply_product.dart';
import '../screens/wishlist/favourite_button.dart';
import '../screens/wishlist/wishlist_cubit.dart';

class CustomProductCart extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final int quantity;
  final ProductDM productDM;
  final Function()? onRemove;

  const CustomProductCart({
    Key? key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    this.onRemove,
    required this.productDM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 111,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  print("Loading image: $url"); // Debug print
                  return Center(child: CircularProgressIndicator());
                },
                errorWidget: (context, url, error) {
                  print("Error loading image: $url - $error"); // Debug print
                  return Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),

          SizedBox(width: 10),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '\$${price}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),

          // Remove Button
          BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, wishlistState) {
              final wishlistCubit =
                  context.read<WishlistCubit>(); // Listen for changes

              final isInWishlist = wishlistCubit.wishlistItems
                  .any((item) => item.id == productDM.id);

              return FavouriteButton(
                productDM,
                isInWishlist,
              );
            },
          ),
        ],
      ),
    );
  }
}
