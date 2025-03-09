
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Features/Profile/Profile/data/data_sources/ResetPasswordDataSource/ResetPasswordRemoteDataSource.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource{
  ApiManager apiManager;
  ResetPasswordRemoteDataSourceImpl(this.apiManager);
  @override
  Future<Map<String, dynamic>> resetPassword(Map<String,dynamic> data) async{
    // TODO: implement resetPassword
    var response =  await apiManager.patchRequest(kChangePasswordEndPoint, data);
    return response.data;
  }
  
}