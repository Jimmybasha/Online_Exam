import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Features/Profile/Profile/data/data_sources/ProfileRemoteDataSource.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiManager apiManager;
  ProfileRemoteDataSourceImpl(this.apiManager);
  @override
  Future<Map<String, dynamic>> updateProfileData(
      Map<String, dynamic> userData) async {
    var res = await apiManager.putRequest(kUpdateProfileEndPoint, userData);
    return res.data;
  }
}
