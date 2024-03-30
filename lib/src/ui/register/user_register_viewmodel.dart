
import 'package:exercise_1/src/domain/dto/user_register_dto.dart';
import 'package:exercise_1/src/ui/register/user_register_state.dart';
import 'package:shared_library/shared_library.dart';

class UserRegisterViewModel extends ViewModel<UserRegisterState> {
  UserRegisterViewModel() : super(const UserRegisterState.initial());

  Future<void> register(String username, String password, String email, String firstName, String lastName ) async {
    try {
      sendValue(const UserRegisterState.loading());

      await Future.delayed(const Duration(seconds: 1)); 
      sendValue(UserRegisterState.data(UserRegisterDTO(username: username, password: password, email: email, firstName: firstName, lastName: lastName)));
    } catch (e) {
      print("error => $e");
      state = const UserRegisterState.error();
    }
  }
}