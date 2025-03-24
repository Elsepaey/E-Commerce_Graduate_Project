


// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduate_project/cubits/contact/contact_state.dart';
// import 'package:graduate_project/models/contact_us_model.dart';
// import 'package:graduate_project/screens/cache/cache_helper.dart';

// class ContactCubit extends Cubit<ContactState> {
//   ContactCubit() : super(ContactState.initial);

//   final TextEditingController name = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController phone = TextEditingController();
//   final TextEditingController message = TextEditingController();

//   void initialize() {
//     if (state.contactUsModel != null) {
//       name.text = state.contactUsModel!.name ?? '';
//       email.text = state.contactUsModel!.email ?? '';
//       phone.text = state.contactUsModel!.phone ?? '';
//       message.text = state.contactUsModel!.message ?? '';
//     }
//   }

//   final Dio dio = Dio();

//  Future<void> getContact() async {
//     try {
//       emit(state.loading());
//       final accessToken = CacheHelper.getString(key: 'accessToken');

//       var headers = {
//         'Authorization': 'Bearer $accessToken',
//       };

//       final response = await dio.post(
//         'https://mohamednowar.pythonanywhere.com/api/contact/',
//         options: Options(
//           method: 'POST',
//           headers: headers,
//         ),
//         data: {
//           'name': name.text,
//           'email': email.text,
//           'phone': phone.text,
//           'message': message.text,
//         },
//       );

//       final contactData = ContactUsModel.fromJson(response.data);
//       emit(state.success(contactUsModel: contactData));
//     } on DioException catch (e) {
//       emit(state.error(e.message ?? 'An error occurred'));
//     }
//   }
// }
