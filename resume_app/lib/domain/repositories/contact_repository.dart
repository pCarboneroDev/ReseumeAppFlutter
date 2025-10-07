import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<ContactModel>>> getAllProjects(String lang);
}