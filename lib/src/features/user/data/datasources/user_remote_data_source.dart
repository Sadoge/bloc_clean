import 'dart:convert';

import 'package:bloc_clean/src/core/error/exceptions.dart';
import 'package:bloc_clean/src/features/user/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(int id);
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser(int id) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
