import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/failure.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}