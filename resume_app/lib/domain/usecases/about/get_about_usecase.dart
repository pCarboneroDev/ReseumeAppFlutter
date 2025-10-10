import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/about_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class GetAboutUsecase implements UseCase<String, AboutModel> {

  final AboutRepository repo;

  GetAboutUsecase({required this.repo});

  @override
  Future<Either<Failure, AboutModel>> call(String params) {
    return repo.getAbout(params);
  }
}