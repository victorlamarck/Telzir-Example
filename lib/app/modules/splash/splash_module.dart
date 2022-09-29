import 'package:example/app/modules/splash/on_boarding/on_boarding_module.dart';
import 'package:example/app/modules/splash/recovery/recovery_module.dart';
import 'package:example/app/modules/splash/register/register_page.dart';
import 'package:example/app/modules/splash/register/register_store.dart';
import 'package:example/app/modules/splash/login/login_page.dart';
import 'package:example/app/modules/splash/login/login_store.dart';
import 'package:example/app/modules/home/home_module.dart';
import 'package:example/app/modules/splash/splash_Page.dart';
import 'package:example/app/modules/splash/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => SplashStore()),
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/recovery/', module: RecoveryModule()),
    ModuleRoute('/on_boarding/', module: OnBoardingModule()),
    ChildRoute('/login/', child: (_, args) => LoginPage()),
    ChildRoute('/register/', child: (_, args) => RegisterPage()),
  ];
}
