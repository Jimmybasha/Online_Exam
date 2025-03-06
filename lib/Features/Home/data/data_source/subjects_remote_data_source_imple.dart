import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/utils/Services/secure_storage.dart';
import 'package:online_exam/Features/Home/data/data_source/subjects_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model.dart';

@Injectable(as: SubjectsRemoteDataSource)
class SubjectsRemoteDataSourceImple implements SubjectsRemoteDataSource {
  final ApiManager apiManager;
  final SecureStorageService secureStorageService;
  SubjectsRemoteDataSourceImple(this.secureStorageService,
      {required this.apiManager});
  @override
  Future<SubjectsModel> getAllSubjects() async {
    String? token = await secureStorageService.readSecureData(kUserToken);
    var response =
        await apiManager.getData(endPoint: kAllSubjectsEndPoint, token: token!);
    SubjectsModel subjectsModel = SubjectsModel.fromJson(response.data);
    return subjectsModel;
  }
}
