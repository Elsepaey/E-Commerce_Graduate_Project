import 'package:graduate_project/models/profile_response_model.dart';

enum ProfileStateStatus {
  initial,
  loading,
  sucess,
  error,
  updateLoading,
  updateSucess,
  updateError,
}

class ProfileState {
  final ProfileStateStatus? profileStateStatus;
  final ProfileResponseModel? profileResponseModel;
  final String? errorMessage;

  ProfileState({
    required this.profileStateStatus,
    required this.profileResponseModel,
    required this.errorMessage,
  });

  static ProfileState initial = ProfileState(
    profileStateStatus: ProfileStateStatus.initial,
    profileResponseModel: null,
    errorMessage: '',
  );

  ProfileState loading() =>
      copyWith(profileStateStatus: ProfileStateStatus.loading);

  ProfileState sucess({
    required ProfileResponseModel profileResponseModel,
  }) =>
      copyWith(
        profileStateStatus: ProfileStateStatus.sucess,
        profileResponseModel: profileResponseModel,
      );

  ProfileState error() =>
      copyWith(profileStateStatus: ProfileStateStatus.error);

  ProfileState copyWith({
    ProfileStateStatus? profileStateStatus,
    ProfileResponseModel? profileResponseModel,
    String? errorMessage,
  }) {
    return ProfileState(
      profileStateStatus: profileStateStatus ?? this.profileStateStatus,
      profileResponseModel: profileResponseModel ?? this.profileResponseModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
