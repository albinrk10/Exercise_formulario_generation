import 'package:freezed_annotation/freezed_annotation.dart';
// 1. Define una clase para el modelo de datos del usuario con @freezed.
part 'user_register_dto.freezed.dart';

@freezed
abstract class UserRegisterDTO with _$UserRegisterDTO {
  const factory UserRegisterDTO({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) = _UserRegisterDTO;
}