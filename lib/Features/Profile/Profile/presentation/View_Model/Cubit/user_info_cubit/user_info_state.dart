part of 'user_info_cubit.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserInfoState {}
final class UserInfoLoading extends UserInfoState {}
final class UserInfoFailure extends UserInfoState {
  final String errorMessage;

 const UserInfoFailure({required this.errorMessage});
}
final class UserInfoSuccess extends UserInfoState {
  final UserInfoModel userInfoModel;

 const UserInfoSuccess({required this.userInfoModel});
}
