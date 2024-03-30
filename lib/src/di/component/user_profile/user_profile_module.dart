import 'package:exercise_1/src/ui/register/user_register_state.dart';
import 'package:exercise_1/src/ui/register/user_register_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


@module
@module
abstract class UserRegisterModule {
  @lazySingleton
  StateNotifierProvider<UserRegisterViewModel, UserRegisterState> provideStateNotifier() {
    return StateNotifierProvider<UserRegisterViewModel, UserRegisterState>((ref) {
      return UserRegisterViewModel();
    });
  }
}