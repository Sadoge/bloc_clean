import 'package:dartz/dartz.dart';
import 'package:bloc_clean/src/core/error/exceptions.dart';
import 'package:bloc_clean/src/core/error/failures.dart';
import 'package:bloc_clean/src/features/user/data/datasources/user_remote_data_source.dart';
import 'package:bloc_clean/src/features/user/domain/entities/user.dart';
import 'package:bloc_clean/src/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final remoteUser = await remoteDataSource.getUser(id);
      return Right(remoteUser);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
