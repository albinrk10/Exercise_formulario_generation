import 'package:exercise_1/src/ui/register/user_register_viewmodel.dart';
import 'package:get_it/get_it.dart';



GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<UserRegisterViewModel>(UserRegisterViewModel());
 
}
// flutter packages pub run build_runner build --delete-conflicting-outputs
