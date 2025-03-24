import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/cubits/profile/profile_state.dart';
import 'package:graduate_project/models/profile_response_model.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial);

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailConttroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController gender = TextEditingController();

  void initil() {
    final password = CacheHelper.getString(key: 'password');
    firstName.text = state.profileResponseModel!.firstName!;
    lastName.text = state.profileResponseModel!.lastName!;
    dobController.text = state.profileResponseModel!.date!;
    phoneController.text = state.profileResponseModel!.phone!;
    emailConttroller.text = state.profileResponseModel!.email!;
    gender.text = state.profileResponseModel!.gender!;
    passwordController.text = password;
  }

  final Dio dio = Dio();

  Future<void> getProfile() async {
    try {
      emit(state.loading());
      final accessToken = CacheHelper.getString(key: 'accessToken');

      // await Future.delayed(const Duration(milliseconds: 2));

      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      print('my token is $accessToken');

      final response = await dio.get(
        'https://mohamednowar.pythonanywhere.com/api/profile/',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      final profielData = ProfileResponseModel.fromJson(response.data);

      emit(state.sucess(
        profileResponseModel: profielData,
      ));
    } on DioException catch (e) {
      print('my error is ${e.response}');
      print('---------------------');
      emit(state.error());
    }
  }

  Future<void> updateProfile() async {
    try {
      emit(
          state.copyWith(profileStateStatus: ProfileStateStatus.updateLoading));
      final accessToken = CacheHelper.getString(key: 'accessToken');

      // await Future.delayed(const Duration(milliseconds: 2));

      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      print('my token is $accessToken');

      final response =
          await dio.put('https://mohamednowar.pythonanywhere.com/api/update/',
              options: Options(
                method: 'PUT',
                headers: headers,
              ),
              data: {
            "first_name": firstName.text,
            "last_name": lastName.text,
            "phone_number": phoneController.text,
            "email": emailConttroller.text,
            "date_of_birth": dobController.text,
            "gender": gender.text,
            "current_password": passwordController.text,
          });

      print(response.data);

      ProfileResponseModel profileResponseModel = ProfileResponseModel();

      profileResponseModel = profileResponseModel.copyWith(
        firstName: response.data['user']['first_name'],
        lastName: response.data['user']['last_name'],
        userName: response.data['user']['username'],
        phone: response.data['user']['phone_number'],
        email: response.data['user']['email'],
        date: response.data['user']['date_of_birth'],
        gender: response.data['user']['gender'],
      );

      emit(
        state.copyWith(
          profileStateStatus: ProfileStateStatus.updateSucess,
          profileResponseModel: profileResponseModel,
        ),
      );
    } on DioException catch (e) {
      print('my error is in update is ${e.response!.data}');
      emit(state.copyWith(
          profileStateStatus: ProfileStateStatus.updateError,
          errorMessage: e.response!.data['message']));
    }
  }
}
