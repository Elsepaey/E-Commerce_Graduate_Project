import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/screens/wishlist/wishlist_cubit.dart';

import '../../models/disply_product.dart';
import '../../services/favourite_repo.dart';
import '../../utils/base_states.dart';
import 'favourite_button_view_model.dart';

class FavouriteButton extends StatelessWidget {
  ProductDM product;
  bool isFavourite;

  FavouriteButton(this.product, this.isFavourite, {super.key});

  late FavouriteButtonViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();

    viewModel = FavouriteButtonViewModel(FavouriteRepo(), wishlistCubit);

    return BlocBuilder(
        bloc: viewModel,
        builder: (context, state) {
          print(state);
          if (state is BaseLoadingState) {
            return Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(9),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2,
              ),
            );
          }
          return InkWell(
            onTap: () {
              viewModel
                  .toggleServiceInFavourite(isFavourite, product.slug)
                  .then((updatedList) {
                viewModel.emitState();
              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Icon(
                size: 20,
                isFavourite == false
                    ? Icons.favorite_outline_rounded
                    : Icons.favorite_rounded,
                color: isFavourite == false ? Colors.grey : Colors.red,
              ),
            ),
          );
        });
  }
}
