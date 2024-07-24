import 'package:bloc_clean/src/features/user/domain/usecases/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'user_state.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  final GetUser getUser;

  UserCubit({required this.getUser}) : super(const UserState.initial());

  Future<void> loadUser(int id) async {
    emit(const UserState.pending());

    final result = await getUser(Params(id: id));

    result.fold(
      (failure) => emit(UserState.error(failure.toString())),
      (user) => emit(UserState.set(user)),
    );
  }
}
