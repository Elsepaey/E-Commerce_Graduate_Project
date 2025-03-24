import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/screens/wishlist/wishlist_cubit.dart';

import '../../widgets/custom_product_cart.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, 'SettingScreen'),
            icon: Icon(Icons.list),
          ),
        ],
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'ProfileScreen'),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 30),
            Text(
              'Wishlist',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          // Accessing the WishlistCubit instance here
          final wishlistCubit = BlocProvider.of<WishlistCubit>(context);

          // Trigger the cubit to load the wishlist if necessary
          if (state is WishlistInitial) {
            wishlistCubit.loadWishlist();
          }

          if (state is WishlistLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is WishlistError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          if (state is WishlistEmpty) {
            return Center(
              child: Text(
                'Your wishlist is empty',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          if (state is WishlistLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final product = state.items[index];
                return CustomProductCart(
                  name: product.name,
                  price: product.price,
                  imageUrl: product.image,
                  quantity: product.quantity,
                  productDM: product,
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
