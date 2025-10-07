import 'package:dartz/dartz.dart';
import 'package:resume_app/data/api_datasource.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';
import 'package:resume_app/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  @override
  Future<Either<Failure, List<ContactModel>>> getAllProjects(String lang) async {
    return await ApiDatasource.getAllContacts(lang);
  }
}