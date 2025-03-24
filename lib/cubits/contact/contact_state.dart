



// import 'package:graduate_project/cubits/contact/contact_state.dart';
// import 'package:graduate_project/models/contact_us_model.dart';
// import 'package:graduate_project/models/profile_response_model.dart';

// enum ContactStateStatus {
//   initial,
//   loading,
//   success, // Corrected spelling
//   error,
// }

// class ContactState {
//   final ContactStateStatus? status; // Updated naming convention
//   final ContactUsModel? contactUsModel; // Updated variable name for consistency
//   final String? errorMessage;

//   ContactState({
//     required this.status,
//     required this.contactUsModel, // Updated parameter name for consistency
//     required this.errorMessage,
//   });

//   static ContactState initial = ContactState(
//     status: ContactStateStatus.initial,
//     contactUsModel: null, // Updated to match the variable name
//     errorMessage: '',
//   );

//   ContactState loading() => copyWith(status: ContactStateStatus.loading);

//   ContactState success({
//     required ContactUsModel
//         contactUsModel, // Updated parameter name for consistency
//   }) =>
//       copyWith(
//         status: ContactStateStatus.success,
//         contactUsModel: contactUsModel, // Updated to match the variable name
//       );

//   ContactState error(String message) =>
//       copyWith(status: ContactStateStatus.error, errorMessage: message);

//   ContactState copyWith({
//     ContactStateStatus? status,
//     ContactUsModel? contactUsModel, // Updated type
//     String? errorMessage,
//   }) {
//     return ContactState(
//       status: status ?? this.status,
//       contactUsModel: contactUsModel ??
//           this.contactUsModel, // Updated to match the variable name
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
// }
