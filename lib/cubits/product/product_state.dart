// import 'package:graduate_project/model/product_model.dart';
import 'package:graduate_project/models/disply_product.dart';

enum ProductStateStatus {
  initial,
  loading,
  sucess,
  error,
}

class ProductState {
  final ProductStateStatus? status;
  final List<ProductDM>? productsModel;
  final String? errorMessage;

  ProductState({
    required this.status,
    required this.productsModel,
    required this.errorMessage,
  });

  static ProductState initial = ProductState(
    status: ProductStateStatus.initial,
    productsModel: [],
    errorMessage: '',
  );

  ProductState loading() => copyWith(status: ProductStateStatus.loading);

  ProductState sucess({
    required List<ProductDM> productsModel,
  }) =>
      copyWith(
        status: ProductStateStatus.sucess,
        productsModel: productsModel,
      );

  ProductState error() => copyWith(status: ProductStateStatus.error);

  ProductState copyWith({
    ProductStateStatus? status,
    List<ProductDM>? productsModel,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      productsModel: productsModel ?? this.productsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
