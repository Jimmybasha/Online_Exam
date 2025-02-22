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

import '../../Features/Auth/data/Data_Source/AuthRemoteDataSource.dart'
    as _i504;
import '../../Features/Auth/data/Data_Source/AuthRemoteDataSourceImple.dart'
    as _i920;
import '../../Features/Auth/data/repos/AuthRepoImpl.dart' as _i475;
import '../../Features/Auth/domain/repos/AuthRepo.dart' as _i347;
import '../../Features/Auth/domain/UseCase/LoginUseCase.dart' as _i238;
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
    gh.factory<_i504.AuthRemoteDataSource>(() =>
        _i920.AuthRemoteDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i347.AuthRepo>(() => _i475.AuthRepoImpl(
        authRemoteDataSource: gh<_i504.AuthRemoteDataSource>()));
    gh.factory<_i238.LoginUseCase>(
        () => _i238.LoginUseCase(authRepo: gh<_i347.AuthRepo>()));
    return this;
  }
}
