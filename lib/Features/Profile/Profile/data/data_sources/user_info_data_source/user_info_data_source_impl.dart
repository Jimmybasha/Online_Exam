import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Features/Profile/Profile/data/data_sources/user_info_data_source/user_info_remote_data_source.dart';
import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';

@Injectable(as: UserInfoRemoteDataSource)
class UserInfoRemoteDataSourceImpl implements UserInfoRemoteDataSource {
  final ApiManager apiManager;

  UserInfoRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<UserInfoModel> getUserData() async{
 var response = await apiManager.getData(endPoint: kUserDataEndPoint);
    return UserInfoModel.fromJson(response.data);
  }
}
