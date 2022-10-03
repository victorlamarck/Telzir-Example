import 'package:dio/dio.dart';
import 'package:disconts/app/shared/core/app_core.dart';
import 'package:disconts/app/shared/exceptions/custom_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:disconts/app/shared/interfaces/user_interface.dart';
import 'package:disconts/app/shared/models/user_model.dart';

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
      final result = await _client.get(
        '/auth/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $userToken',
          },
        ),
      );

      return Right(UserModel.fromMap(result.data));
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }

  @override
  Future<Either<CustomException, UserModel>> register({
    required String? name,
    required String? email,
    required String? cpfCnpj,
  }) async {
    try {
      final result = await _client.post(
        '/user/login',
        data: {
          "name": name,
          "email": email,
          "cpf_cnpj": cpfCnpj,
        },
      );

      return Right(UserModel.fromMap(result.data));
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }

  @override
  Future<Either<CustomException, UserModel>> confirmEmail({
    String? email,
    String? code,
  }) async {
    try {
      final result = await _client.post(
        '/auth/confirm-email',
        data: {
          "email": email,
          "code": code,
        },
      );

      return Right(UserModel.fromMap(result.data));
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }

  @override
  Future<Either<CustomException, bool>> forgotPassword({String? email}) async {
    try {
      await _client.post(
        '/auth/forgot-password',
        data: {
          "email": email,
        },
      );

      return const Right(true);
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }

  @override
  Future<Either<CustomException, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _client.post(
        '/auth/login',
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

  @override
  Future<Either<CustomException, UserModel>> registerPassword({
    String? userId,
    String? password,
    String? confirmationPassword,
  }) async {
    try {
      final result = await _client.post(
        '/auth/register-password/$userId',
        data: {
          "password": password,
          "password_confirmation": confirmationPassword,
        },
      );

      return Right(UserModel.fromMap(result.data));
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }

  @override
  Future<Either<CustomException, UserModel>> resetPassword({
    String? email,
    String? code,
    String? password,
  }) async {
    try {
      final result = await _client.post(
        '/auth/reset-password',
        data: {
          "email": email,
          "code": code,
          "password": password,
        },
      );

      return Right(UserModel.fromMap(result.data));
    } on DioError catch (e) {
      return Left(CustomException(e.response?.data));
    }
  }
}
