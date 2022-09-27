import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:example/app/shared/exceptions/custom_exception.dart';
import 'package:example/app/shared/interfaces/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService implements ILocalStorage {
  Completer<Box> boxCompleter = Completer<Box>();

  HiveService() {
    _init();
  }

  _init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    final box = await Hive.openBox('disconts');
    if (!boxCompleter.isCompleted) boxCompleter.complete(box);
  }

  @override
  Future<Either<CustomException, String>> getUserToken() async {
    final box = await boxCompleter.future;
    final result = box.get('user-token');

    if (result == null) {
      return Left(CustomException(null));
    } else {
      return Right(result);
    }
  }

  @override
  Future saveUserToken(String token) async {
    final box = await boxCompleter.future;

    box.put('user-token', token);
  }

  @override
  Future clearUserToken() async {
    final box = await boxCompleter.future;

    box.put('user-token', null);
  }

  Future<void> cache(String path, dynamic data) async {
    final cache = await boxCompleter.future;

    cache.put(path, data);
  }

  Future<dynamic> getCache(String path) async {
    final cache = await boxCompleter.future;

    return cache.get(path);
  }
}
