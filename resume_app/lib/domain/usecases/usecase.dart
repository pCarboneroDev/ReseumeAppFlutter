import 'package:dartz/dartz.dart';
import 'package:resume_app/domain/exceptions/Failure.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}