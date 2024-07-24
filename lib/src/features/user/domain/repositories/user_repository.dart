import 'package:dartz/dartz.dart';
import 'package:bloc_clean/src/core/error/failures.dart';
import 'package:bloc_clean/src/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(int id);
}
