import 'package:dartz/dartz.dart';
import 'package:example/app/shared/exceptions/custom_exception.dart';

abstract class ILocalStorage {
  /// Save a token on local storage.
  Future saveUserToken(String token);

  /// Clear token from local storage.
  Future clearUserToken();

  /// Get current token from local storage.
  Future<Either<CustomException, String>> getUserToken();

  Future<void> cache(String path, dynamic data);

  Future<dynamic> getCache(String path);
}
