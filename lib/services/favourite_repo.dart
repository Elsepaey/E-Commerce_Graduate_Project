import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';

import '../../models/failures.dart';
import '../models/FavouriteResponse.dart';
import '../models/disply_product.dart';

class FavouriteRepo {
  FavouriteRepo();

  Future<Either<Failure, List<ProductDM>?>> getLoadedFavouriteList() async {
    String token = CacheHelper.getString(key: "accessToken");

    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      try {
        String url = "https://mohamednowar.pythonanywhere.com/api/wishlist/";

        Dio dio = Dio();
        Response response = await dio.get(
          url,
          options: Options(
            headers: {
              "Accept": "application/json",
              'Authorization': 'Bearer $token',
            },
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          print("getLoadedFavouriteList success");

          // Handle the direct array response
          if (response.data is List) {
            List<dynamic> jsonList = response.data;
            List<ProductDM> products = [];

            for (var item in jsonList) {
              if (item is Map<String, dynamic> && item.containsKey('product')) {
                products.add(ProductDM.fromJson(item['product']));
              }
            }

            return Right(products);
          }
          // If the API might sometimes return the wrapper object format
          else if (response.data is Map) {
            Map<String, dynamic> json = response.data;
            if (json.containsKey('data')) {
              WishlistResponse favouriteResponse =
                  WishlistResponse.fromJson(json);
              return Right(favouriteResponse.data);
            }
          }

          // If we can't parse it in any expected format
          return Left(Failure("Invalid response format"));
        } else {
          print("getLoadedFavouriteList failed");

          // For error responses, try to parse as a wrapper object if possible
          if (response.data is Map) {
            Map<String, dynamic> json = response.data;
            if (json.containsKey('message')) {
              return Left(Failure(json['message'] ?? "Something went wrong"));
            }
          }

          return Left(
              Failure("Request failed with status: ${response.statusCode}"));
        }
      } catch (e) {
        print("getLoadedFavouriteList Exception = $e");
        return Left(Failure("يوجد خطأ ما!"));
      }
    } else {
      return Left(Failure("لا يوجد اتصال بالانترنت!"));
    }
  }

  Future<Either<Failure, bool>> toggleServiceInFavourite(
      bool isFavourite, String productSlug) async {
    final String token = CacheHelper.getString(key: "accessToken");
    final Dio dio = Dio();

    try {
      final String url = isFavourite
          ? 'https://mohamednowar.pythonanywhere.com/api/wishlist/delete/$productSlug/'
          : 'https://mohamednowar.pythonanywhere.com/api/wishlist/';

      final Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        validateStatus: (status) => status != null && status < 500,
      );

      final Response response = isFavourite
          ? await dio.delete(url, options: options)
          : await dio.post(url,
              data: {'product_slug': productSlug}, options: options);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        print(isFavourite
            ? 'Item successfully deleted from wishlist'
            : 'Item successfully added to wishlist');
        return Right(true);
      } else {
        print(
            'Failed to ${isFavourite ? 'delete' : 'add'} item: ${response.statusCode}');
        return Right(false);
      }
    } on DioException catch (e) {
      print(
          'Error ${isFavourite ? 'deleting' : 'adding'} item from wishlist: ${e.message}');
      return Left(Failure(e.message ?? 'Unknown error'));
    }
  }
  // Future<bool> deleteWishlistItem(String slug) async {
  //   final dio = Dio();
  //   final url =
  //       'https://mohammednowar.pythonanywhere.com/api/wishlist/delete/$slug/';
  //
  //   try {
  //     final response = await dio.delete(url);
  //
  //     // Check if the request was successful (status code 200 or 204)
  //     if (response.statusCode == 200 || response.statusCode == 204) {
  //       print('Item successfully deleted from wishlist');
  //       return true;
  //     } else {
  //       print('Failed to delete item: ${response.statusCode}');
  //       return false;
  //     }
  //   } on DioException catch (e) {
  //     print('Error deleting item from wishlist: ${e.message}');
  //     return false;
  //   }
  // }
  //
  // Future<bool> addWishlistItem(String productSlug) async {
  //   final dio = Dio();
  //   final url = 'https://mohamednowar.pythonanywhere.com/api/wishlist/';
  //
  //   try {
  //     // Prepare the request body based on the Postman example
  //     final data = {
  //       'product_slug': productSlug,
  //     };
  //
  //     final response = await dio.post(
  //       url,
  //       data: data,
  //       options: Options(
  //         contentType: Headers.jsonContentType,
  //       ),
  //     );
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print('Item successfully added to wishlist');
  //       return true;
  //     } else {
  //       print('Failed to add item: ${response.statusCode}');
  //       return false;
  //     }
  //   } on DioException catch (e) {
  //     print('Error adding item to wishlist: ${e.message}');
  //     return false;
  //   }
  // }
}
//   Future<Either<Failure, List<ProductDM>?>> toggleServiceInFavourite(
//       num serviceId) async {
//     String token = (await sharedPrefUtils.getToken())!;
//
//     final List<ConnectivityResult> connectivityResult =
//         await (Connectivity().checkConnectivity());
//
//     if (connectivityResult.contains(ConnectivityResult.mobile) ||
//         connectivityResult.contains(ConnectivityResult.wifi)) {
//       try {
//         String baseUrl = "EndPoints.baseUrl";
//         String endPoints = "EndPoints.favourite";
//         String url = "https://$baseUrl$endPoints";
//
//         Dio dio = Dio();
//         Response response = await dio.post(
//           url,
//           data: {
//             "service_id": "$serviceId",
//           },
//           options: Options(
//             headers: {
//               "Accept": "application/json",
//               'Authorization': 'Bearer $token',
//             },
//             validateStatus: (status) {
//               return status! < 500;
//             },
//           ),
//         );
//
//         Map json = response.data;
//         FavouriteResponse favouriteResponse = FavouriteResponse.fromJson(json);
//
//         if (response.statusCode! >= 200 && response.statusCode! < 300) {
//           print("toggleServiceInFavourite success");
//           return Right(favouriteResponse.data);
//         } else {
//           print("toggleServiceInFavourite failed");
//           return Left(
//               Failure(favouriteResponse.message ?? "something went wrong"));
//         }
//       } catch (e) {
//         print("toggleServiceInFavourite Exception = $e");
//         return Left(Failure("يوجد خطأ ما!"));
//       }
//     } else {
//       return Left(Failure("لا يوجد اتصال بالانترنت!"));
//     }
//   }
// }

class WishlistService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://mohamednowar.pythonanywhere.com/api';

  // Constructor to set up auth token if needed
  WishlistService({String? authToken}) {
    if (authToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $authToken';
    }
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  // Add item to wishlist
  Future<WishlistResponse> addToWishlist(String productSlug) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/wishlist/',
        data: {'product_slug': productSlug},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WishlistResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to add to wishlist: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio specific errors
      String errorMessage = 'An error occurred';
      if (e.response != null) {
        errorMessage = 'Error: ${e.response?.statusCode} - ${e.response?.data}';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timeout';
      } else if (e.type == DioExceptionType.unknown && e.error != null) {
        errorMessage = 'Network error: ${e.error}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      // Handle other errors
      throw Exception('Failed to add to wishlist: $e');
    }
  }
}
