import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/models/disply_product.dart';
import 'package:graduate_project/screens/wishlist/wishlist_cubit.dart';

import '../../../../utils/base_states.dart';
import '../../services/favourite_repo.dart';

class FavouriteButtonViewModel extends Cubit {
  FavouriteRepo favouriteRepo;
  final WishlistCubit wishlistCubit;

  FavouriteButtonViewModel(
    this.favouriteRepo,
    this.wishlistCubit,
  ) : super(BaseInitialState());

  Future<List<ProductDM>?> toggleServiceInFavourite(
      bool isFavourite, String productSlug) async {
    emit(BaseLoadingState());
    var either =
        await favouriteRepo.toggleServiceInFavourite(isFavourite, productSlug);

    List<ProductDM>? updatedList;
    either.fold(
      (error) {
        emit(BaseErrorState(error.errorMessage));
      },
      (list) {
        print(list);
        wishlistCubit.loadWishlist();
        emit(BaseSuccessState());
      },
    );
    return updatedList;
  }

  void emitState() {
    emit(BaseSuccessState());
  }
}
