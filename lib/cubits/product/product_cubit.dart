import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/cubits/product/product_state.dart';
import 'package:graduate_project/models/disply_product.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState.initial);

  static ProductCubit get productCubit => ProductCubit();
  final Dio dio = Dio();
  Future<void> getProducts() async {
    try {
      emit(state.copyWith(status: ProductStateStatus.loading));
      final accessToken = CacheHelper.getString(key: 'accessToken');

      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      print('my token is $accessToken');

      final response = await dio.get(
        'https://mohamednowar.pythonanywhere.com/api/products/',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      final List<dynamic> respnseDynamic = response.data;
      final List<ProductDM> products =
          respnseDynamic.map((value) => ProductDM.fromJson(value)).toList();

      print('--------------');
      print('my error in product is ${response.data}');
      print('--------------');

      emit(state.copyWith(
          productsModel: products, status: ProductStateStatus.sucess));
    } on DioException catch (e) {
      print('--------------');
      print('my error in product is ${e.response}');
      print('--------------');
      emit(state.copyWith(status: ProductStateStatus.error));
    }
  }
}

//filter
