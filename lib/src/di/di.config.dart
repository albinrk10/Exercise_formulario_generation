// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:exercise_1/src/ui/register/user_register_viewmodel.dart' as _i7;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../ui/register/user_register_state.dart' as _i8;
import 'component/user_profile/user_profile_module.dart' as _i10;


extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final userRegisterModule = _$UserRegisterModule();
    
   
  
   gh.lazySingleton<
    _i6.StateNotifierProvider<_i7.UserRegisterViewModel, _i8.UserRegisterState>>(
  () => userRegisterModule.provideStateNotifier()
);
return this;
  }
}



class _$UserRegisterModule extends _i10.UserRegisterModule {}
