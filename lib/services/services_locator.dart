import 'package:get_it/get_it.dart' show GetIt;
import 'package:graduate_project/cubits/profile/profile_cubit.dart';

class ServicesLocator {
  static final GetIt locator = GetIt.instance;

 static void setup() {
    locator.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
  }

  static ProfileCubit get profileCubit => locator<ProfileCubit>();
}
