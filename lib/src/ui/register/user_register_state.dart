import 'package:exercise_1/src/domain/dto/user_register_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_register_state.freezed.dart';

@freezed
abstract class UserRegisterState with _$UserRegisterState {
  const factory UserRegisterState.initial() = Initial;
  const factory UserRegisterState.loading() = Loading;
  const factory UserRegisterState.error() = Error;
  const factory UserRegisterState.data(UserRegisterDTO userRegisterDTO) = Data;
}
