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
  Future<Either<CustomException, UserModel>> signIn({
    required String email,
    required String password,
  });
}
