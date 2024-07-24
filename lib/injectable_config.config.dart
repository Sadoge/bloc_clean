// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'src/core/external_dependencies_module.dart' as _i9;
import 'src/features/user/data/datasources/user_remote_data_source.dart' as _i4;
import 'src/features/user/data/repositories/user_repository_impl.dart' as _i6;
import 'src/features/user/domain/repositories/user_repository.dart' as _i5;
import 'src/features/user/domain/usecases/get_user.dart' as _i7;
import 'src/features/user/presentation/cubits/user_cubit.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final externalDependenciesModule = _$ExternalDependenciesModule();
  gh.lazySingleton<_i3.Client>(() => externalDependenciesModule.httpClient);
  gh.lazySingleton<_i4.UserRemoteDataSource>(
      () => _i4.UserRemoteDataSourceImpl(client: gh<_i3.Client>()));
  gh.lazySingleton<_i5.UserRepository>(() =>
      _i6.UserRepositoryImpl(remoteDataSource: gh<_i4.UserRemoteDataSource>()));
  gh.lazySingleton<_i7.GetUser>(() => _i7.GetUser(gh<_i5.UserRepository>()));
  gh.lazySingleton<_i8.UserCubit>(
      () => _i8.UserCubit(getUser: gh<_i7.GetUser>()));
  return getIt;
}

class _$ExternalDependenciesModule extends _i9.ExternalDependenciesModule {}
