import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model.dart';
import 'package:online_exam/Features/Home/domain/repos/subjects_repo.dart';

@injectable
class GetAllSubjectsUseCase {
  final SubjectsRepo subjectsRepo;

  GetAllSubjectsUseCase({required this.subjectsRepo});
  Future<Either<Failure, SubjectsModel>> call() async {
   return await subjectsRepo.getAllSubjects();
  }
}
