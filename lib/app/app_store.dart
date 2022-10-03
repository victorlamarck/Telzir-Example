import 'package:asuka/asuka.dart';
import 'package:disconts/app/shared/interfaces/local_storage_interface.dart';
import 'package:disconts/app/shared/interfaces/user_interface.dart';
import 'package:disconts/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final userRepository = Modular.get<IUser>();
  final localStorageRepository = Modular.get<ILocalStorage>();

  @observable
  UserModel? _user;

  @computed
  UserModel? get user => _user;

  @computed
  bool get isLogged => _user != null;

  @action
  Future<bool> login(String email, String password) async {
    final result = await userRepository.login(
      email: email,
      password: password,
    );

    result.fold(
      (l) => AsukaSnackbar.message(l.message).show(),
      (r) {
        _user = r;
        localStorageRepository.saveUserToken(user?.token ?? '');
      },
    );

    return result.isRight();
  }

  @action
  Future<void> tryLoginWithUserToken() async {
    final result = await localStorageRepository.getUserToken();

    if (result.isRight()) {
      final token = result.getOrElse(() => '');
      final userResult = await userRepository.getUser(userToken: token);

      userResult.fold(
        (l) => null,
        (r) {
          r.token = token;
          _user = r;
        },
      );
    }
  }

  @action
  logout() {
    _user = null;
    localStorageRepository.clearUserToken();
  }
}
