// wishlist_cubit.dart
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graduate_project/services/favourite_repo.dart';

import '../../models/disply_product.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  List<ProductDM> wishlistItems = [];

  WishlistCubit() : super(WishlistInitial());
  FavouriteRepo favouriteRepo = FavouriteRepo();
  Future<void> loadWishlist() async {
    try {
      emit(WishlistLoading());
      final result = await favouriteRepo.getLoadedFavouriteList();

      result.fold(
        (failure) => emit(WishlistError(failure.errorMessage)),
        (products) {
          if (products == null || products.isEmpty) {
            emit(WishlistEmpty());
          } else {
            wishlistItems = products;
            emit(WishlistLoaded(wishlistItems));
          }
        },
      );
    } catch (e) {
      emit(WishlistError('An error occurred while loading wishlist'));
    }
  }
}

class Product {}
