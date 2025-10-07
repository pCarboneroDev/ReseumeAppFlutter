import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/contact_repository.dart';
import 'package:resume_app/domain/usecases/usecase.dart';

class GetAllContactUsecase implements UseCase<String, List<ContactModel>> {

  final ContactRepository repo;

  const GetAllContactUsecase({required this.repo});
  
  @override
  Future<Either<Failure, List<ContactModel>>> call(String params) {
    return repo.getAllProjects(params);
  }
}