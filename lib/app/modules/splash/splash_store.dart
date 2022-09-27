import 'package:example/app/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final app = Modular.get<AppStore>();

  @observable
  double opacity = 1;

  init() async {
    await Future.wait([
      app.tryLoginWithUserToken(),
      doAnimation(),
    ]);

    Modular.to.navigate('/on_boarding/');
  }

  Future doAnimation() async {
    opacity = 0;
    await Future.delayed(const Duration(milliseconds: 300));

    opacity = 1;
    await Future.delayed(const Duration(milliseconds: 1300));
  }
}
