import 'package:dartz/dartz.dart';
import 'package:disconts/app/shared/exceptions/custom_exception.dart';
import 'package:disconts/app/shared/models/user_model.dart';

abstract class IUser {
  /// Return your current user.
  /// Needs [User.token].
  Future<Either<CustomException, UserModel>> getUser({
    required String userToken,
  });

  /// Sign in a user and return itself.
  Future<Either<CustomException, UserModel>> login({
    required String email,
    required String password,
  });

  /// Register a user and return itself.
  Future<Either<CustomException, UserModel>> register({
    required String? name,
    required String? email,
    required String? cpfCnpj,
  });

  /// Confirm a user email and return a user.
  Future<Either<CustomException, UserModel>> confirmEmail({
    String? email,
    String? code,
  });

  /// Register new password.
  Future<Either<CustomException, UserModel>> registerPassword({
    String? userId,
    String? password,
    String? confirmationPassword,
  });

  /// Forgot password.
  Future<Either<CustomException, bool>> forgotPassword({
    String? email,
  });

  /// Forgot password.
  Future<Either<CustomException, UserModel>> resetPassword({
    String? email,
    String? code,
    String? password,
  });
}
