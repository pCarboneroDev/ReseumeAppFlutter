import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/entities/about_model.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class AboutRepository {
  Future<Either<Failure, AboutModel>> getAbout(String lang);
}