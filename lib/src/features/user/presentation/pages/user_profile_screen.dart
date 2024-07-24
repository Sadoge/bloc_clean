import 'package:bloc_clean/injectable_config.dart';
import 'package:bloc_clean/src/features/user/presentation/cubits/user_cubit.dart';
import 'package:bloc_clean/src/features/user/presentation/cubits/user_state.dart';
import 'package:bloc_clean/src/features/user/presentation/widgets/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('User Profile')),
        body: BlocBuilder<UserCubit, UserState>(
          bloc: getIt<UserCubit>(),
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: Text('Press the button to load user')),
              pending: () => const Center(child: CircularProgressIndicator()),
              set: (user) => Center(child: UserInfoCard(user: user)),
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => getIt<UserCubit>().loadUser(1),
          child: const Icon(Icons.refresh),
        ),
      );
}
