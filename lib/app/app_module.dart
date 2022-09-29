import 'package:dio/dio.dart';
import 'package:disconts/app/app_store.dart';
import 'package:disconts/app/modules/splash/splash_module.dart';
import 'package:disconts/app/shared/repositories/user_repository.dart';
import 'package:disconts/app/shared/services/hive_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppStore()),
    Bind.lazySingleton((i) => HiveService()),
    Bind.lazySingleton((i) => UserRepository(Dio())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: SplashModule()),
  ];
}
