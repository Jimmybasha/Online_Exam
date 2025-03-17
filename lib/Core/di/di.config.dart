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
import '../../Features/Home/data/data_source/exam_data_source/exam_remote_data_source.dart'
    as _i789;
import '../../Features/Home/data/data_source/exam_data_source/exam_remote_data_source_impl.dart'
    as _i1035;
import '../../Features/Home/data/data_source/questions_data_source/questions_remote_data_source.dart'
    as _i794;
import '../../Features/Home/data/data_source/questions_data_source/questions_remote_data_source_impl.dart'
    as _i375;
import '../../Features/Home/data/data_source/score_data_source/check_answers_data_source_impl.dart'
    as _i47;
import '../../Features/Home/data/data_source/score_data_source/check_answers_remote_data_source.dart'
    as _i553;
import '../../Features/Home/data/data_source/subjects_data_source/subjects_remote_data_source.dart'
    as _i368;
import '../../Features/Home/data/data_source/subjects_data_source/subjects_remote_data_source_imple.dart'
    as _i1036;
import '../../Features/Home/data/repos/check_answers_repo_impl.dart' as _i274;
import '../../Features/Home/data/repos/exams_repo_impl.dart' as _i310;
import '../../Features/Home/data/repos/questions_repo_impl.dart' as _i354;
import '../../Features/Home/data/repos/subject_repo_impl.dart' as _i1024;
import '../../Features/Home/domain/repos/check_answers_repo.dart' as _i68;
import '../../Features/Home/domain/repos/exams_repo.dart' as _i714;
import '../../Features/Home/domain/repos/questions_repo.dart' as _i602;
import '../../Features/Home/domain/repos/subjects_repo.dart' as _i1034;
import '../../Features/Home/domain/use_cases/check_answers_use_case.dart'
    as _i238;
import '../../Features/Home/domain/use_cases/get_all_exams_on_subjects_use_case.dart'
    as _i733;
import '../../Features/Home/domain/use_cases/get_all_questions_on_exam_use_case.dart'
    as _i1049;
import '../../Features/Home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i259;
import '../../Features/Profile/Profile/data/data_sources/ProfileRemoteDataSource.dart'
    as _i703;
import '../../Features/Profile/Profile/data/data_sources/ProfileRemoteDataSourceImpl.dart'
    as _i564;
import '../../Features/Profile/Profile/data/data_sources/ResetPasswordDataSource/ResetPasswordRemoteDataSource.dart'
    as _i669;
import '../../Features/Profile/Profile/data/data_sources/ResetPasswordDataSource/ResetPasswordRemoteDataSourceImpl.dart'
    as _i438;
import '../../Features/Profile/Profile/data/data_sources/user_info_data_source/user_info_data_source_impl.dart'
    as _i977;
import '../../Features/Profile/Profile/data/data_sources/user_info_data_source/user_info_remote_data_source.dart'
    as _i132;
import '../../Features/Profile/Profile/data/repositories/ProfileRepoImpl.dart'
    as _i1046;
import '../../Features/Profile/Profile/data/repositories/ResetPasswordRepoImpl.dart'
    as _i329;
import '../../Features/Profile/Profile/data/repositories/user_info_repo_impl.dart'
    as _i135;
import '../../Features/Profile/Profile/domain/repositories/ProfileRepo.dart'
    as _i805;
import '../../Features/Profile/Profile/domain/repositories/ResetPasswordRepo.dart'
    as _i251;
import '../../Features/Profile/Profile/domain/repositories/user_info_repo.dart'
    as _i699;
import '../../Features/Profile/Profile/domain/use_cases/UpdatePasswordUseCase.dart'
    as _i776;
import '../../Features/Profile/Profile/domain/use_cases/UpdateProfileDataUseCase.dart'
    as _i763;
import '../../Features/Profile/Profile/domain/use_cases/user_info_use_case.dart'
    as _i588;
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
    gh.factory<_i703.ProfileRemoteDataSource>(
        () => _i564.ProfileRemoteDataSourceImpl(gh<_i211.ApiManager>()));
    gh.factory<_i132.UserInfoRemoteDataSource>(() =>
        _i977.UserInfoRemoteDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i805.ProfileRepo>(
        () => _i1046.ProfileRepoImpl(gh<_i703.ProfileRemoteDataSource>()));
    gh.factory<_i368.SubjectsRemoteDataSource>(
        () => _i1036.SubjectsRemoteDataSourceImple(
              gh<_i323.SecureStorageService>(),
              apiManager: gh<_i211.ApiManager>(),
            ));
    gh.factory<_i504.AuthRemoteDataSource>(() =>
        _i920.AuthRemoteDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i669.ResetPasswordRemoteDataSource>(
        () => _i438.ResetPasswordRemoteDataSourceImpl(gh<_i211.ApiManager>()));
    gh.factory<_i789.ExamRemoteDataSource>(() =>
        _i1035.ExamRemoteDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i553.CheckAnswersDataSource>(() =>
        _i47.CheckAnswersDataSourceImpl(apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i794.QuestionsRemoteDataSource>(() =>
        _i375.QuestionsRemoteDataSourceImpl(
            apiManager: gh<_i211.ApiManager>()));
    gh.factory<_i235.ISignUpDataSource>(
        () => _i1072.AuthRemoteDataSourceImpl(gh<_i211.ApiManager>()));
    gh.factory<_i1034.SubjectsRepo>(() => _i1024.SubjectRepoImpl(
        subjectsRemoteDataSource: gh<_i368.SubjectsRemoteDataSource>()));
    gh.factory<_i714.ExamsRepo>(() => _i310.ExamsRepoImpl(
        examRemoteDataSource: gh<_i789.ExamRemoteDataSource>()));
    gh.factory<_i733.GetAllExamsOnSubjectsUseCase>(() =>
        _i733.GetAllExamsOnSubjectsUseCase(examsRepo: gh<_i714.ExamsRepo>()));
    gh.factory<_i763.UpdateProfileDataUseCase>(
        () => _i763.UpdateProfileDataUseCase(gh<_i805.ProfileRepo>()));
    gh.factory<_i251.ResetPasswordRepo>(() =>
        _i329.ResetPasswordRepoImpl(gh<_i669.ResetPasswordRemoteDataSource>()));
    gh.factory<_i602.QuestionsRepo>(() => _i354.QuestionsRepoImpl(
        questionsRemoteDataSource: gh<_i794.QuestionsRemoteDataSource>()));
    gh.factory<_i347.AuthRepo>(() => _i475.AuthRepoImpl(
        authRemoteDataSource: gh<_i504.AuthRemoteDataSource>()));
    gh.factory<_i699.UserInfoRepo>(() => _i135.UserInfoRepoImpl(
        userInfoRemoteDataSource: gh<_i132.UserInfoRemoteDataSource>()));
    gh.factory<_i776.UpdatePasswordUseCase>(
        () => _i776.UpdatePasswordUseCase(gh<_i251.ResetPasswordRepo>()));
    gh.factory<_i7.ResetPasswordUseCase>(
        () => _i7.ResetPasswordUseCase(gh<_i347.AuthRepo>()));
    gh.factory<_i462.SignUpRepo>(
        () => _i737.SignUpRepoImpl(gh<_i235.ISignUpDataSource>()));
    gh.factory<_i259.GetAllSubjectsUseCase>(() =>
        _i259.GetAllSubjectsUseCase(subjectsRepo: gh<_i1034.SubjectsRepo>()));
    gh.factory<_i588.UserInfoUseCase>(
        () => _i588.UserInfoUseCase(userInfoRepo: gh<_i699.UserInfoRepo>()));
    gh.factory<_i68.CheckAnswersRepo>(() => _i274.CheckAnswersRepoImpl(
        checkAnswersDataSource: gh<_i553.CheckAnswersDataSource>()));
    gh.factory<_i238.CheckAnswersUseCase>(() => _i238.CheckAnswersUseCase(
        checkAnswersRepo: gh<_i68.CheckAnswersRepo>()));
    gh.factory<_i224.SignUpUseCase>(
        () => _i224.SignUpUseCase(gh<_i462.SignUpRepo>()));
    gh.factory<_i138.SignUpViewModel>(
        () => _i138.SignUpViewModel(gh<_i224.SignUpUseCase>()));
    gh.factory<_i1049.GetAllQuestionsOnExamUseCase>(() =>
        _i1049.GetAllQuestionsOnExamUseCase(
            questionsRepo: gh<_i602.QuestionsRepo>()));
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
