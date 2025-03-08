import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model/subjects_model.dart';

abstract class SubjectsRepo {
  Future<Either<Failure, SubjectsModel>> getAllSubjects();
  
}
