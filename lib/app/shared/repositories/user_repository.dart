import 'package:dio/dio.dart';
import 'package:example/app/shared/core/app_core.dart';
import 'package:example/app/shared/exceptions/custom_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:example/app/shared/interfaces/local_storage_interface.dart';
import 'package:example/app/shared/interfaces/user_interface.dart';
import 'package:example/app/shared/models/user_model.dart';
import 'package:example/app/shared/services/internet_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserRepository implements IUser {
  final Dio _client;

  UserRepository(this._client) {
    _init();
  }

  _init() {
    _client.options = BaseOptions(
      baseUrl: AppCore.apiUrl,
      contentType: 'application/json',
      responseType: ResponseType.json,
      receiveTimeout: 60000,
      connectTimeout: 60000,
    );
  }

  @override
  Future<Either<CustomException, UserModel>> getUser({
    required String userToken,
  }) async {
    try {
      if (await InternetService.hasNetwork()) {
        final result = await _client.get(
          '/user',
          options: Options(
            headers: {'x-access-token': userToken},
          ),
        );

        Modular.get<ILocalStorage>().cache('/user', result.data);

        return Right(UserModel.fromMap(result.data));
      } else {
        final data = await Modular.get<ILocalStorage>().getCache('/user');

        return Right(UserModel.fromMap(data));
      }
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }

  @override
  Future<Either<CustomException, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _client.post(
        '/user/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      return Right(UserModel.fromMap(result.data));
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }
}
