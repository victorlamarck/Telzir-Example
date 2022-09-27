// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStoreBase, Store {
  Computed<UserModel?>? _$userComputed;

  @override
  UserModel? get user => (_$userComputed ??=
          Computed<UserModel?>(() => super.user, name: '_AppStoreBase.user'))
      .value;
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??=
          Computed<bool>(() => super.isLogged, name: '_AppStoreBase.isLogged'))
      .value;

  late final _$_userAtom = Atom(name: '_AppStoreBase._user', context: context);

  @override
  UserModel? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(UserModel? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AppStoreBase.login', context: context);

  @override
  Future<bool> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$tryLoginWithUserTokenAsyncAction =
      AsyncAction('_AppStoreBase.tryLoginWithUserToken', context: context);

  @override
  Future<void> tryLoginWithUserToken() {
    return _$tryLoginWithUserTokenAsyncAction
        .run(() => super.tryLoginWithUserToken());
  }

  late final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase', context: context);

  @override
  dynamic logout() {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged}
    ''';
  }
}
