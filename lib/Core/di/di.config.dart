// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Features/Auth/Sign_Up/data/data_sources/Remote/SignUpDataSource.dart'
    as _i235;
import '../../Features/Auth/Sign_Up/data/data_sources/Remote/SignUpDataSourceImpl.dart'
    as _i1072;
import '../../Features/Auth/Sign_Up/data/repositories/SignUpRepoImpl.dart'
    as _i737;
import '../../Features/Auth/Sign_Up/domain/repositories/SignUpRepo.dart'
    as _i462;
import '../../Features/Auth/Sign_Up/domain/use_cases/SignUpUseCase.dart'
    as _i224;
import '../../Features/Auth/Sign_Up/presentation/View_Model/cubits/SignUpViewModel.dart'
    as _i138;
import '../ApiManager/ApiManager.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i211.ApiManager>(() => _i211.ApiManager());
    gh.factory<_i235.ISignUpDataSource>(
        () => _i1072.AuthRemoteDataSourceImpl(gh<_i211.ApiManager>()));
    gh.factory<_i462.SignUpRepo>(
        () => _i737.SignUpRepoImpl(gh<_i235.ISignUpDataSource>()));
    gh.factory<_i224.SignUpUseCase>(
        () => _i224.SignUpUseCase(gh<_i462.SignUpRepo>()));
    gh.factory<_i138.SignUpViewModel>(
        () => _i138.SignUpViewModel(gh<_i224.SignUpUseCase>()));
    return this;
  }
}
