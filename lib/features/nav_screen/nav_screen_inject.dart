import '../../injection_container.dart';
import 'presentation/cubit/nav_screen_cubit.dart';

void initNavScreenInjection() {
  sl.registerLazySingleton(() => NavScreenCubit());
}
