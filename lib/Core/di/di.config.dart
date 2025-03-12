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
import '../../Features/Auth/domain/UseCase/ForgetPasswordUseCase.dart' as _i169;
import '../../Features/Auth/domain/UseCase/LoginUseCase.dart' as _i238;
import '../../Features/Auth/domain/UseCase/ResetPasswordUseCase.dart' as _i7;
import '../../Features/Auth/domain/UseCase/VerifyCodeUseCase.dart' as _i250;
import '../../Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordViewModel.dart'
    as _i1041;
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
import '../../Features/Profile/Profile/data/data_sources/ProfileRemoteDataSource.dart'
    as _i703;
import '../../Features/Profile/Profile/data/data_sources/ProfileRemoteDataSourceImpl.dart'
    as _i564;
import '../../Features/Profile/Profile/data/data_sources/ResetPasswordDataSource/ResetPasswordRemoteDataSource.dart'
    as _i669;
import '../../Features/Profile/Profile/data/data_sources/ResetPasswordDataSource/ResetPasswordRemoteDataSourceImpl.dart'
    as _i438;
import '../../Features/Profile/Profile/data/repositories/ProfileRepoImpl.dart'
    as _i1046;
import '../../Features/Profile/Profile/data/repositories/ResetPasswordRepoImpl.dart'
    as _i329;
import '../../Features/Profile/Profile/domain/repositories/ProfileRepo.dart'
    as _i805;
import '../../Features/Profile/Profile/domain/repositories/ResetPasswordRepo.dart'
    as _i251;
import '../../Features/Profile/Profile/domain/use_cases/UpdatePasswordUseCase.dart'
    as _i776;
import '../../Features/Profile/Profile/domain/use_cases/UpdateProfileDataUseCase.dart'
    as _i763;
import '../ApiManager/ApiManager.dart' as _i211;
import '../utils/Services/secure_storage.dart' as _i323;

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
    gh.singleton<_i323.SecureStorageService>(
        () => _i323.SecureStorageService());
    gh.factory<_i368.SubjectsRemoteDataSource>(
        () => _i1036.SubjectsRemoteDataSourceImple(
              gh<_i323.SecureStorageService>(),
              apiManager: gh<_i211.ApiManager>(),
            ));
    gh.factory<_i504.AuthRemoteDataSource>(() =>
        _i920.AuthRemoteDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i789.ExamRemoteDataSource>(() =>
        _i1035.ExamRemoteDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i235.ISignUpDataSource>(
        () => _i1072.AuthRemoteDataSourceImpl(gh<_i211.ApiManager>()));
    gh.factory<_i1034.SubjectsRepo>(() => _i1024.SubjectRepoImpl(
        subjectsRemoteDataSource: gh<_i368.SubjectsRemoteDataSource>()));
    gh.factory<_i714.ExamsRepo>(() => _i310.ExamsRepoImpl(
        examRemoteDataSource: gh<_i789.ExamRemoteDataSource>()));
    gh.factory<_i733.GetAllExamsOnSubjectsUseCase>(() =>
        _i733.GetAllExamsOnSubjectsUseCase(examsRepo: gh<_i714.ExamsRepo>()));
    gh.factory<_i347.AuthRepo>(() => _i475.AuthRepoImpl(
        authRemoteDataSource: gh<_i504.AuthRemoteDataSource>()));
    gh.factory<_i462.SignUpRepo>(
        () => _i737.SignUpRepoImpl(gh<_i235.ISignUpDataSource>()));
    gh.factory<_i259.GetAllSubjectsUseCase>(() =>
        _i259.GetAllSubjectsUseCase(subjectsRepo: gh<_i1034.SubjectsRepo>()));
    gh.factory<_i224.SignUpUseCase>(
        () => _i224.SignUpUseCase(gh<_i462.SignUpRepo>()));
    gh.factory<_i138.SignUpViewModel>(
        () => _i138.SignUpViewModel(gh<_i224.SignUpUseCase>()));
    gh.factory<_i169.ForgetPasswordUseCase>(
        () => _i169.ForgetPasswordUseCase(authRepo: gh<_i347.AuthRepo>()));
    gh.factory<_i238.LoginUseCase>(
        () => _i238.LoginUseCase(authRepo: gh<_i347.AuthRepo>()));
    gh.factory<_i250.VerifyCodeUseCase>(
        () => _i250.VerifyCodeUseCase(authRepo: gh<_i347.AuthRepo>()));
    gh.factory<_i1041.ForgetPasswordViewModel>(() =>
        _i1041.ForgetPasswordViewModel(gh<_i169.ForgetPasswordUseCase>()));
    return this;
  }
}
