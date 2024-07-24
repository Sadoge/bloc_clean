import 'package:bloc_clean/src/features/user/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.pending() = _Pending;
  const factory UserState.set(User user) = _Set;
  const factory UserState.error(String message) = _Error;
}
